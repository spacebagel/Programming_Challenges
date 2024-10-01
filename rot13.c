#include <stdio.h>
#include <string.h>

#define CIPHER_STEP 13
#define ENG_LANG_WIDTH 26
#define ENG_LANG_FIRST_SYMBOL 'a'
#define ENG_LANG_LAST_SYMBOL 'z'
#define ENG_LANG_FIRST_UPPER_SYMBOL 'A'
#define ENG_LANG_LAST_UPPER_SYMBOL 'Z'

char cipherSymbol(char c)
{
	if (c >= ENG_LANG_FIRST_SYMBOL && c <= ENG_LANG_LAST_SYMBOL)
	{
		return ENG_LANG_FIRST_SYMBOL + (c - ENG_LANG_FIRST_SYMBOL + CIPHER_STEP) % ENG_LANG_WIDTH;
	}
	if (c >= ENG_LANG_FIRST_UPPER_SYMBOL && c <= ENG_LANG_LAST_UPPER_SYMBOL)
	{
		return ENG_LANG_FIRST_UPPER_SYMBOL + (c - ENG_LANG_FIRST_UPPER_SYMBOL + CIPHER_STEP) % ENG_LANG_WIDTH;
	}
	return c;
}

int main()
{
	printf("Input text: ");
	char inputText[256];

	if (fgets(inputText, sizeof(inputText), stdin) != NULL)
    	{
		size_t length = strlen(inputText);
		if (length > 0 && inputText[length - 1] == '\n')
		    inputText[length - 1] = '\0';
		
		for (int i = 0; inputText[i] != '\0'; i++)
			printf("%c", cipherSymbol(inputText[i]));
			
		printf("\n");
    	}

	return 0;
}
