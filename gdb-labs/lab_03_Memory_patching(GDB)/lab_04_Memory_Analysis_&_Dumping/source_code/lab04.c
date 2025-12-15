#define _FORTIFY_SOURCE 0 
#define _GNU_SOURCE  

#include <stdio.h>
#include <string.h>

char secret[] = "THIS_IS_SECRET";

int main() {
    char buf[16];
    printf("Enter text: ");
    gets(buf); // unsafe, on purpose for lab
    printf("You entered: %s\n", buf);
    return 0;
}