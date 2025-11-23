# 🧠 Structure Packing and Memory Alignment

Understanding **Structure Packing** and **Data Alignment** is fundamental for low-level development and crucial for precisely calculating memory offsets during **exploit development**.

**Structure Padding** is a compiler technique used to insert unused bytes (padding) between structure members or at the end of the structure. This ensures that subsequent members (and the structure itself) start at a memory address that is a **multiple of their size** (alignment requirement), allowing the processor to access data efficiently.

The consequence is that the total size of a structure is often **greater** than the sum of its members' individual sizes.

-----

## 🔬 Default Alignment in Practice

On modern systems (e.g., 64-bit), the default alignment requirement for a structure is typically the **size of its largest member**.

Consider the following structure, where typically `int` is 4 bytes, `char` is 1 byte, and `double` is 8 bytes. The largest member is `double` (8 bytes), so the entire structure must be aligned to an 8-byte boundary.

```c
#include <stdio.h>
#include <stddef.h> // For size_t

struct Test {
    int a;    // 4 bytes
    char b;   // 1 byte
    double c; // 8 bytes
};

int main() {
    struct Test test1;
    size_t size_of_struct = sizeof(struct Test);

    printf("--- Memory Layout (Default Alignment) ---\n");
    printf("Size of struct Test:\t%zu bytes\n", size_of_struct);
    printf("Offset of a (int):\t%zu\n", offsetof(struct Test, a));
    printf("Offset of b (char):\t%zu\n", offsetof(struct Test, b));
    printf("Offset of c (double):\t%zu\n", offsetof(struct Test, c));

    return 0;
}
```

### **Expected Layout Analysis (Assuming 8-byte alignment)**

| Member | Size | Start Offset | Alignment | Padding Added | End Offset |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `int a` | 4 bytes | 0 | $0 \pmod 4 = 0$ (OK) | 0 bytes | 4 |
| `char b` | 1 byte | 4 | $4 \pmod 1 = 0$ (OK) | 0 bytes | 5 |
| **Padding** | **3 bytes** | 5 | Must align `double` to $8 \pmod 8 = 0$ | **3 bytes** | 8 |
| `double c` | 8 bytes | 8 | $8 \pmod 8 = 0$ (OK) | 0 bytes | 16 |
| **Trailing Padding** | **0 bytes** | 16 | Total size $16 \pmod 8 = 0$ (OK) | 0 bytes | **16** |

**Actual `sizeof(struct Test)`: 16 bytes**

The total size is 16 bytes, not the $4+1+8 = 13$ bytes, due to the 3 bytes of padding inserted before `double c` to meet its 8-byte alignment requirement.

-----

## 🛠️ Disabling Padding: Manual Packing

In exploit development, network programming, or hardware interfacing, we sometimes need to eliminate padding to ensure the structure size is predictable and minimal. This is achieved using **compiler-specific directives** to force a smaller alignment requirement (often 1 byte).

**⚠️ Warning:** Using packed structures can significantly reduce data access performance or even cause crashes (unaligned memory access faults) on certain architectures.

### **Using `__attribute__((packed))` (GCC/Clang)**

This attribute forces the compiler to use the minimum required alignment, effectively placing the members adjacently in memory.

```c
#include <stdio.h>
#include <stddef.h>

struct TestPacked {
    int a;    // 4 bytes
    char b;   // 1 byte
    double c; // 8 bytes
} __attribute__((packed)); // <--- The packed attribute

int main() {
    size_t size_of_struct = sizeof(struct TestPacked);

    printf("--- Memory Layout (Packed) ---\n");
    printf("Size of struct TestPacked:\t%zu bytes\n", size_of_struct);
    printf("Offset of a (int):\t%zu\n", offsetof(struct TestPacked, a));
    printf("Offset of b (char):\t%zu\n", offsetof(struct TestPacked, b));
    printf("Offset of c (double):\t%zu\n", offsetof(struct TestPacked, c));
    
    return 0;
}
```

### **Packed Layout Analysis**

With packing, the compiler ignores the alignment rules:

| Member | Size | Start Offset | Padding Added | End Offset |
| :--- | :--- | :--- | :--- | :--- |
| `int a` | 4 bytes | 0 | 0 bytes | 4 |
| `char b` | 1 byte | 4 | 0 bytes | 5 |
| `double c` | 8 bytes | 5 | 0 bytes | 13 |
| **Total `sizeof(TestPacked)`** | **13 bytes** | | | **13** |

**Actual `sizeof(struct TestPacked)`: 13 bytes** (Matches the sum of members).

The offsets are $a=0, b=4, c=5$. 

-----