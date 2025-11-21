#include <stdio.h>

int countStr(char val[]) {
    char *p = val;
    int length = 0;

    while (*p != '\0') {
        length++;
        p++;
    }

    return length;
}

int main() {
    char s[] = "Ravindu";

    printf("Length is: %d\n", countStr(s));
    return 0;
}
