using System.ComponentModel;
using System.Windows.Media;

namespace ColorApp;

internal class MainViewModel : INotifyPropertyChanged
{
    private string rColor, gColor, bColor, rOutColor, gOutColor, bOutColor;
    private Brush outBgColor, inBgColor;

    private void ChangeFunctions()
    {
        ChangeOutBg();
        ChangeInBg();
    }

    public string RColor
    {
        get => rColor;
        set
        {
            if (rColor != value && CheckLimits(value))
            {
                rColor = value;
                rOutColor = ResultOut(value);
                OnPropertyChanged(nameof(RColor));
                OnPropertyChanged(nameof(ROutColor));
                ChangeFunctions();
            }
        }
    }

    public string GColor
    {
        get => gColor;
        set
        {
            if (gColor != value && CheckLimits(value))
            {
                gColor = value;
                gOutColor = ResultOut(value);
                OnPropertyChanged(nameof(GColor));
                OnPropertyChanged(nameof(GOutColor));
                ChangeFunctions();
            }
        }
    }

    public string BColor
    {
        get => bColor;
        set
        {
            if (bColor != value && CheckLimits(value))
            {
                bColor = value;
                bOutColor = ResultOut(value);
                OnPropertyChanged(nameof(BColor));
                OnPropertyChanged(nameof(BOutColor));
                ChangeFunctions();
            }
        }
    }

    public string ROutColor
    {
        get => rOutColor;
        set
        {
            if (rOutColor != value && CheckLimits(value))
            {
                rOutColor = value;
                rColor = ResultOut(value);
                OnPropertyChanged(nameof(RColor));
                OnPropertyChanged(nameof(ROutColor));
                ChangeFunctions();
            }
        }
    }

    public string GOutColor
    {
        get => gOutColor;
        set
        {
            if (gOutColor != value && CheckLimits(value))
            {
                gOutColor = value;
                gColor = ResultOut(value);
                OnPropertyChanged(nameof(GOutColor));
                OnPropertyChanged(nameof(GColor));
                ChangeFunctions();
            }
        }
    }

    public string BOutColor
    {
        get => bOutColor;
        set
        {
            if (bOutColor != value && CheckLimits(value))
            {
                bOutColor = value;
                bColor = ResultOut(value);
                OnPropertyChanged(nameof(BOutColor));
                OnPropertyChanged(nameof(BColor));
                ChangeFunctions();
            }
        }
    }

    public Brush OutBgColor
    {
        get => outBgColor;
        set
        {
            outBgColor = value;
        }
    }

    public Brush InBgColor
    {
        get => inBgColor;
        set
        {
            inBgColor = value;
        }
    }

    private void ChangeOutBg()
    {
        outBgColor = CheckRGB(rOutColor, gOutColor, bOutColor);
        OnPropertyChanged(nameof(OutBgColor));
    }

    private void ChangeInBg()
    {
        inBgColor = CheckRGB(rColor, gColor, bColor);
        OnPropertyChanged(nameof(InBgColor));
    }

    private bool CheckLimits(string value) => (int.TryParse(value, out int o) && o >= 0 && o <= 255) || value == string.Empty;
    private Brush CheckRGB(string rColor, string gColor, string bColor) =>
        int.TryParse(rColor, out int o) && (int.TryParse(gColor, out int a)) && (int.TryParse(bColor, out int b)) ?
        new SolidColorBrush(Color.FromArgb(255, (byte)o, (byte)a, (byte)b)) : new SolidColorBrush(Color.FromArgb(255, (byte)0, (byte)0, (byte)0));
    private string ResultOut(string value) => value != string.Empty ? (255 - Convert.ToInt32(value)).ToString() : string.Empty;

    public event PropertyChangedEventHandler PropertyChanged;
    protected void OnPropertyChanged(string propertyName)
    {
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }
}
