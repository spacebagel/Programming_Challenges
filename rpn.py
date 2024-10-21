input_string = input("Problem string: ")
stack = input_string.split(' ')

numStack = []
funcStack = []

for element in stack:
    if element.lstrip('-').isdigit():
        numStack.append(int(element))
    elif len(numStack) >= 2: 
        operation = element
        num1 = numStack.pop()
        num2 = numStack.pop()
        if operation == '+':
            numStack.append(num2 + num1)
        elif operation == '-':
            numStack.append(num2 - num1)
        elif operation == '*':
            numStack.append(num2 * num1)
        elif operation == '/' and num1 != 0:
            numStack.append(num2 / num1)
        elif operation == '/' and num1 == 0:
            numStack.append("ERROR! Division by zero.")
        elif operation == '^':
            numStack.append(num2 ** num1)
        else:
            numStack.append("ERROR! Wrong symbol.")
    else:
        numStack.append("ERROR! Not enough numbers in stack.")

print("Result:", numStack.pop())