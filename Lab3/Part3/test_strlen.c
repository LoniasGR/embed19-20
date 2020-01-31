#include <stdio.h>

extern size_t strlen(const char *s);

int main(void) 
{
    char str1[] = "String";

    printf("Length of the string is: %d\n", strlen(str1));
    return 0;
}