use IO;
use Random;

var items = ["r", "p", "s"];
var fullItemNames = ["rock", "paper", "scissors"];

while true do {
    var rs = new randomStream(int);
    var itemId = rs.next(0, 2);
    var pcResult = items[itemId];

    writeln("....\nr - rock\np - paper\ns - scissors\nEnter: ");
    var input = stdin.readLine();
    if (items.count(input) == 0)
    {
        writeln("ERROP: Bad Input");
        continue;
    }
    writeln("PC: ", fullItemNames[itemId]);
    if (pcResult == input)
    {
        writeln("Draw");
        break;
    }
    var resutSum = pcResult + input;
    if (resutSum == "rp" || resutSum == "ps" || resutSum == "sr")
    {
        writeln("User WIN");
        break;
    }
    else      
    {
        writeln("Computer WIN"); 
        break;
   }
}