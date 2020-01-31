#include <stdio.h>

extern char *strcpy(char *dest, const char *src);

int main(void) 
{
    char str1[] = "String";
    char str2[6];

    strcpy(str2, str1);

    printf("New string is: %s\n", str2);
    return 0;
}