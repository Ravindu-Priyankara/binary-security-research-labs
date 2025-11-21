#include <stdio.h>

void display(int arr[], int size, char name[]) {
    printf("%s: ", name);
    for (int i = 0; i < size; i++) {
        printf("%d", arr[i]);
        if (i < size - 1) printf(", ");
    }
    printf("\n");
}

int main() {
    int a[] = {1, 2, 3};
    int b[] = {10, 20, 30};

    int *p1 = a;
    int *p2 = b;

    display(a, 3, "a before");
    display(b, 3, "b before");

    for (int i = 0; i < 3; i++) {
        *p1 = *p2;   // copy value
        p1++;
        p2++;
    }

    display(a, 3, "a after copy");
    display(b, 3, "b unchanged");

    return 0;
}
