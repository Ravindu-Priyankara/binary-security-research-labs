#include <stdio.h>
#include <unistd.h>

void vuln() {
    char buf[64];
    puts("Input:");
    read(0, buf, 200);
}

int main() {
    vuln();
    return 0;
}
