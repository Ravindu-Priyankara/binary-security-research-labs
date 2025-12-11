#include <stdio.h>
#include <string.h>

int check(char *s) {
    if(!strcmp(s, "password123"))
        return 1;
    return 0;
}

int main() {
    char input[64];
    printf("Enter password: ");
    scanf("%63s", input);

    if(check(input))
        puts("Access Granted");
    else
        puts("Access Denied");

    return 0;
}