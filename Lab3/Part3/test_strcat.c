#include <stdio.h>

extern char *strcat(char *dest, const char *src);

int main(void) 
{
    char str1[11] = "String\0";
    char str2[5] = "Four\0";

    strcat(str1, str2);

    printf("New string is: %s\n", str1);
    return 0;
}