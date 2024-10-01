#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>
#include <locale.h>

#define MAX_WORDS 1000
#define MAX_WORD_LEN 50
#define MAX_CHAIN_LEN 100

typedef struct Node {
    char word[MAX_WORD_LEN];
    struct Node* next[MAX_WORDS];
    int next_count;
} Node;

Node* nodes[MAX_WORDS];
int node_count  = 0;

Node* find_node(const char* word)
{
    for (int i = 0; i < node_count; i++)
    {
        if (strcmp(nodes[i]->word, word) == 0)
        {
            return nodes[i];
        }
    }
    return NULL;
}

Node* create_node(const char* word)
{
    Node* node = (Node*)malloc(sizeof(Node));
    strcpy(node->word, word);
    node->next_count = 0;
    nodes[node_count++] = node;
    return node;
}

void add_transition(const char* word1, const char* word2)
{
    Node* node1 = find_node(word1);
    if (!node1) node1 = create_node(word1);
    Node* node2 = find_node(word2);
    if (!node2) node2 = create_node(word2);

    node1->next[node1->next_count++] = node2;
}

void generate_text(const char* start_word)
{
    Node* current = find_node(start_word);
    if (!current) {
        printf("Word %s is not exist", start_word);
        return;
    }

    printf("%s", start_word);

    for (int i = 0; i < MAX_CHAIN_LEN; i++)
    {
        if (current -> next_count == 0) break;

        int next_index = rand() % current->next_count;
        current = current->next[next_index];

        printf(" %s", current->word);
    }
    printf("\n");
}

void build_chain(char* input_text)
{
    char* word1 = strtok(input_text, " ");
    char* word2;

    while ((word2 = strtok(NULL, " ")) != NULL)
    {
        add_transition(word1, word2);
        word1 = word2;
    }
}

int main()
{
    srand(time(NULL));
    printf("Paste text\n> ");
    char text[MAX_WORD_LEN * MAX_WORDS];
    char inputChar;
    for(int i = 0; (inputChar = getchar()) != EOF; i++)
    {
        text[i] = inputChar;
    }

    build_chain(text);
    char word[MAX_WORD_LEN];
    printf("Start word: ");
    for (int i = 0; (inputChar = getchar()) != '\n'; i++)
    {
        word[i] = inputChar;
    }
    generate_text(word);
    return 0;
}