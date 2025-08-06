import std.stdio;
import std.conv;

void main()
{
    writef("Enter a number: ");
    int num;

    readf("%d", &num);
    int prime;

    while (num % 2 == 0)
    {
        prime = 2;
        num /= 2;
    }

    for (int i = 3; i * i <= num; i += 2)
    {
        while (num % i == 0)
        {
            prime = i;
            num /= i;
        }
    }

    if (num > 2) prime = num;

    writef("%s\n", prime);
}