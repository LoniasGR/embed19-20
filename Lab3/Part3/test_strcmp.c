#include <stdio.h>

extern int strcmp(const char *s1, const char *s2);

int main(void) 
{
    char str1[11] = "String\0";
    char str2[5] = "Sour\0";
    char str3[7] = "String\0";
    int result;
    
    result = strcmp(str1, str2);
    printf("Test 1: %d\n", result);

    result = strcmp(str2, str1);
    printf("Test 2: %d\n", result);

    result = strcmp(str1, str3);
    printf("Test 3: %d\n", result);




    return 0;
}