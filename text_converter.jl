function string_converter(text, base)
    result = String[]
    for char in text
        push!(result, (string(Int(char), base = base)))
    end
    return result
end

print("Enter some text: ")
text = readline()

print("Covert to:\n1 - Hex\n2 - Binary\nEnter option: ")
option = readline()

if option == "1"
    println(join(string_converter(text, 16)))
elseif option == "2"
    println(join(string_converter(text, 2)))
else
    println("Error: Incorrect input")
end