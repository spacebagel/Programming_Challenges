import std/strutils
import std/math

echo "Enter the count of digits after comma: "
var result = 0.0'f64 
var dCount = parseInt(readLine(stdin))

if dCount > 0:
    var seriesCount = 100 * 10 ^ dCount
    
    for i in 0..(seriesCount - 1):
        result += (-1) ^ i / (2 * i + 1)
else:
    echo "ERROR: Bad Input!"

echo (4 * result)