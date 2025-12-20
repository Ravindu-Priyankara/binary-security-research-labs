#include <stdio.h>
#include <string.h>
#include <stdint.h>

/*
 * Lab02.4
 * Purpose:
 *  - No direct strcmp-based branch
 *  - Conditions split across blocks
 *  - Flags reused
 *  - Opaque predicates
 *  - Graph view misleading after -Ofast
 */

static int confuse(int x) {
    // Opaque predicate: always true, but compiler can’t easily drop it
    return ((x * 7) % 7) == 0;
}

static int checksum(const char *s) {
    int sum = 0;
    for (int i = 0; s[i]; i++) {
        sum += (s[i] ^ 0x55);
    }
    return sum;
}

int main(void) {
    char buf[64];
    int ok = 0;

    puts("Enter password:");
    fgets(buf, sizeof(buf), stdin);
    buf[strcspn(buf, "\n")] = 0;

    int len = strlen(buf);

    // Fake logic layer 1
    if (confuse(len)) {
        ok ^= 1;
    }

    // Fake logic layer 2 (flag reuse bait)
    if ((len & 1) == 0) {
        ok ^= 1;
    }

    // Real check (but buried)
    if (checksum(buf) == 0x2d4) {
        ok ^= 1;
    }

    // Inverted final decision
    if ((ok ^ 1) == 0) {
        puts("Access Granted");
    } else {
        puts("Access Denied");
    }

    return 0;
}