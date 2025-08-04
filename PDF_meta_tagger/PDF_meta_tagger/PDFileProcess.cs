using iTextSharp.text.pdf;
namespace PDFMetaTagger;
public class PDFileProcess
{
    public static string ChangeTags()
    {
        Console.Write("Path to file: ");
        string sourcePdf = Console.ReadLine();
        if (!File.Exists(sourcePdf)) return "ERROR: Invalid input file path!";

        Console.Write("Output file path: ");
        string outputPdf = Console.ReadLine();
        if (outputPdf == null) return "ERROR: Invalid output file path!";
        
        using (PdfReader reader = new PdfReader(sourcePdf))
        {
            using (FileStream fs = new FileStream(outputPdf, FileMode.Create))
            {
                using (PdfStamper stamper = new PdfStamper(reader, fs))
                {
                    var info = reader.Info;
                    string[] tags =  [ "Title", "Creator", "Author", "CreationDate", "Subject", "Keywords" ];
                    foreach (var tag in tags)
                    {
                        Console.Write(tag + ": ");
                        string inputText = Console.ReadLine();
                        info[tag] = inputText != string.Empty ? inputText : info[tag];
                    }
                    stamper.MoreInfo = info;
                }
            }
        }
        return "File has been created";
    }
}