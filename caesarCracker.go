package main

import (
    "fmt"
    "strings"
    "bufio"
    "os"
)

const (
    firstChar = 1040
    lastChar  = 1071
)

func main() {
    fmt.Print("Type encrypted text: ")
    reader := bufio.NewReader(os.Stdin)
    s, err := reader.ReadString('\n')
    if err != nil {
        fmt.Println("Error reading input:", err)
        return
    }

    s = strings.ToUpper(strings.TrimSpace(s))
    for shift := 1; shift < 32; shift++ {
        fmt.Printf("Сдвиг %d: ", shift)
        var result strings.Builder

        for _, currentRune := range s {
            current := int(currentRune)
            if current >= firstChar && current <= lastChar {
                shifted := current - shift
                if shifted < firstChar {
                    shifted = lastChar - (firstChar - shifted - 1)
                }
                result.WriteRune(rune(shifted))
            } else {
                result.WriteRune(currentRune)
            }
        }
        fmt.Println(result.String())
    }
}
