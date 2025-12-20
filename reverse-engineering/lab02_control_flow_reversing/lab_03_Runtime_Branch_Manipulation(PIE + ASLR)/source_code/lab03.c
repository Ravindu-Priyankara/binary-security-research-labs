#include <stdio.h>
#include <string.h>

int check(char *input) {
    char key[] = "patch_me";
    if (strcmp(input, key) == 0)
        return 1;
    return 0;
}

int main() {
    char buf[64];

    puts("Enter password:");
    fgets(buf, sizeof(buf), stdin);
    buf[strcspn(buf, "\n")] = 0;

    if (check(buf)) {
        puts("Access Granted");
    } else {
        puts("Access Denied");
    }

    return 0;
}