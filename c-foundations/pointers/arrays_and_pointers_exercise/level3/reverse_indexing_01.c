#include <stdio.h>

int main() {
    int arr[5] = {10, 20, 30, 40, 50};

    for (int i = 4; i >= 0; i--) {
        printf("%d", i[arr]);
        if (i > 0) printf(", ");
    }

    printf("\n");
    return 0;
}
