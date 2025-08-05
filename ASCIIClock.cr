rS = "████  "
rH = "    ██"
cV = "  ██  "
lH = "██    "
mS = "██  ██"
fH = "██████"

digits = [
[fH, mS, mS, mS, fH],
[rS, cV, cV, cV, fH],
[fH, rH, fH, lH, fH],
[fH, rH, fH, rH, fH],
[mS, mS, fH, rH, rH],
[fH, lH, fH, rH, fH],
[fH, lH, fH, mS, fH],
[rS, cV, fH, cV, cV],
[fH, mS, fH, mS, fH],
[fH, mS, fH, rH, fH]
]

while true
    puts "\033c"
    timeParts = Time.local.to_s("%H%M")
    result = ""

    (0..4).each do |digitElement|
        (0..3).each do |timePart|
            result += digits[timeParts[timePart].to_i][digitElement] + " "
            if timePart == 1
                if digitElement == 1 || digitElement == 3
                    result += "█ " 
                else
                    result += "  "
                end
            end
        end
        result += "\n"
    end

    puts result
    puts ""
    sleep 1.minutes
end