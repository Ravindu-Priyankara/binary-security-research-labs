# 📚 C Structures (structs) - Foundational Concepts

This section explores the fundamental concepts of C structures (`struct`) through practical examples. A deep understanding of how structures are defined, initialized, stored, and passed is **critical for exploit development**, especially when analyzing data layout, padding, and memory corruption vulnerabilities like **Buffer Overflows** and **Type Confusion**.

## 🎯 What Are Structures?

In C, a `struct` (structure) is a **user-defined composite data type** that groups related data items of **different data types** under a single name. They enable the creation of new, more complex types.

### **Example: Defining and Initializing a Structure**

```c
#include <stdio.h>
#include <string.h>

struct student {
    int id;
    char name[10];
    int marks;
};

int main() {
    // 1. Standard Declaration and Member Access
    struct student A;
    A.id = 1234;
    strcpy(A.name, "ABC");
    A.marks = 22;

    printf("Student A: %d\t%s\t%d\n", A.id, A.name, A.marks);

    // 2. Declaration with Direct Initialization
    struct student B = {1212, "AAA", 99};

    // 3. Declaration with Designated Initializers (C99 standard and later)
    struct student C = {.name = "BBB", .id = 1232, .marks = 89};

    printf("Student B: %d\t%s\t%d\n", B.id, B.name, B.marks);
    printf("Student C: %d\t%s\t%d\n", C.id, C.name, C.marks);

    return 0;
}
```

### **Default Initialization**

  * By default, **local** structure members are **not** automatically initialized to $0$ or $NULL$; they will contain **garbage values**.

  * However, if a structure variable is declared with an initializer (even if it's an **empty initializer** like `struct student D = {};`), **all members not explicitly initialized are zero-initialized**. This behavior is crucial for security contexts.

-----

## 💾 Structure Memory Operations

### **Copying Structures**

Structures can be copied directly using the assignment operator (`=`). This performs a **shallow, member-by-member copy** of the data.

```c
#include <stdio.h>

struct test {
    int test_id;
    int test_marks;
};

int main() {
    struct test A1 = {1, 23};
    struct test A2 = A1; // A2 is now a deep copy of the contents of A1

    printf("A2 Contents: ID=%d, Marks=%d\n", A2.test_id, A2.test_marks);
    return 0;
}
```

### **Passing Structures to Functions**

When passing a structure to a function, there are two primary methods with distinct performance and security implications:

1.  **Pass by Value (Copy):** The entire structure is copied to the function's stack frame. This is **safe** but **inefficient** for large structures.

2.  **Pass by Reference (Pointer):** A pointer to the structure is passed. This is **efficient** as only a memory address is copied, but it allows the function to **modify the original structure**, which must be considered during security analysis.

<!-- end list -->

```c
#include <stdio.h>

struct test {
    int id;
};

// A is passed by value (copy) - changes are local
// B is passed by reference (pointer) - changes affect the original
void increment(struct test A, struct test * B) {
    A.id++; // Only affects the local copy
    B->id++; // Affects the original B
}

int main() {
    struct test A = {123};
    struct test B = {123};

    // Note: The cast to (void *) is unnecessary and can be removed,
    // though the code works as is. The argument should be &B.
    increment(A, &B); 

    printf("A.id (Passed by Value) =\t%d,\nB.id (Passed by Reference) =\t%d\n", A.id, B.id);

    return 0;
}
```

-----

## 🧑‍💻 Advanced Structure Usage

### **`typedef` for Structures**

The `typedef` keyword is used to create an **alias** (a shorter or more semantic name) for an existing type, which simplifies code by eliminating the need to repeatedly use the `struct` keyword.

```c
#include <stdio.h>

// Defines 'testX' as an alias for the unnamed structure
typedef struct {
    int id;
} testX;

// Defines 'testY' as an alias for the unnamed structure
typedef struct {
    int id;
} testY;


int main() {
    testX A = {1}; // Cleaner syntax
    testY B = {2};

    printf("A.id = %d\tvs\tB.id = %d\n", A.id, B.id);

    return 0;
}
```

### **Nested Structures**

A nested structure contains another structure as one of its members. This is used to model complex, hierarchical data relationships.

#### **Accessing Nested Members**

Members of a nested structure are accessed by chaining the dot operator (`.`).

```c
#include <stdio.h>

struct child {
    char name[10];
};

struct parent {
    char name[10];
    struct child B; // Nested structure member
};

int main() {
    // Initialization must match the hierarchy
    struct parent A = {"FatherName", {"ChildName"}}; 

    // Access: parent.child.member
    printf("%s has a child named %s\n", A.name, A.B.name);

    return 0;
}
```

### **Structure Pointer and the Arrow Operator**

A **structure pointer** is a variable that stores the memory address of a structure. When using a structure pointer, the **arrow operator** (`->`) is used as a shorthand to access its members, replacing the combination of the dereference operator (`*`) and the dot operator (`.`).

$$
\text{ptr} \rightarrow \text{member} \quad \equiv \quad (*\text{ptr}).\text{member}
$$

```c
#include <stdio.h>

struct point {
    int id;
};

int main() {
    struct point x = {1};
    struct point * ptr = &x; // ptr holds the address of x

    printf("Access via Arrow Operator (ptr->id): %d\n", ptr->id);
    printf("Access via Dereference/Dot (*ptr).id: %d\n", (*ptr).id);

    return 0;
}
```

-----