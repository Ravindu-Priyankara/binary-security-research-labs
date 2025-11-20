# 📘 **Arrays & Pointers — Complete README**

## 🧩 Introduction

Arrays and pointers are deeply connected in C.
Understanding them is one of the most powerful skills we can develop because it unlocks:

* Memory manipulation
* Pointer arithmetic
* Efficient data structures
* Buffer management
* Low‑level exploit development


---

# 🔥 1. What is an Array?

An array is a **contiguous block of memory** storing multiple values of the same type.

Example:

```c
int arr[3] = {10, 20, 30};
```

Memory layout (each int = 4 bytes):

```
Address     Value
-----------------------
0x1000  →   10  (arr[0])
0x1004  →   20  (arr[1])
0x1008  →   30  (arr[2])
```

---

# 🔥 2. What is a Pointer?

A pointer stores the **memory address** of a variable.

```c
int a = 5;
int *p = &a;
```

* `a`  = value (5)
* `&a` = address
* `p`  = pointer storing `&a`
* `*p` = dereference → value of `a`

---

# 🔥 3. Relationship Between Arrays & Pointers

In C:

> **Array name behaves like a pointer to the first element.**

```c
int arr[3] = {10, 20, 30};
int *p = arr;
```

This is the same as:

```c
int *p = &arr[0];
```

Memory view:

```
arr   = address of arr[0]
p     = address of arr[0]
&p    = address of pointer p (different)
```

---

# 🔥 4. Pointer Arithmetic with Arrays

Pointers move in steps of the element size.

If `p = arr`, then:

| Expression | Meaning           |
| ---------- | ----------------- |
| `p`        | address of arr[0] |
| `p + 1`    | address of arr[1] |
| `p + 2`    | address of arr[2] |
| `*(p)`     | arr[0]            |
| `*(p + 1)` | arr[1]            |
| `*(p + 2)` | arr[2]            |

Example:

```c
printf("%d\n", *(p + 1)); // prints arr[1]
```

---

# 🔥 5. Array Index vs Pointer Access

Indexing and pointer arithmetic are equivalent:

```c
arr[i] == *(arr + i)
p[i]   == *(p + i)
```

Example:

```c
int arr[3] = {10, 20, 30};
int *p = arr;

printf("%d\n", arr[1]);     // 20
printf("%d\n", *(arr+1));   // 20
printf("%d\n", p[1]);       // 20
printf("%d\n", *(p+1));     // 20
```

---

# 🔥 6. Arrays Are Not Modifiable Pointers

You cannot change `arr`:

```c
arr = arr + 1; // ❌ invalid
```

But pointer is flexible:

```c
p = p + 1;     // ✔ valid
```

---

# 🔥 7. Passing Arrays to Functions

Arrays decay into pointers when passed to functions.

Function:

```c
void printArray(int *ptr, int size) {
    for (int i = 0; i < size; i++) {
        printf("%d ", ptr[i]);
    }
}
```

Call:

```c
printArray(arr, 3);
```

---

# 🔥 8. Dangerous Mistake: Treating Single Variable as Array

```c
int a = 10;
int *p = &a;

printf("%d\n", p[1]);  // ❌ Undefined behavior
```

Why?

* `a` is NOT an array
* `p[1]` tries to access memory after `a`
* This may print garbage or crash

Valid only for actual arrays or allocated memory.

---

# 🔥 9. Memory Diagram Example

For this code:

```c
int arr[3] = {10, 20, 30};
int *p = arr;
```

Diagram:

```
+---------+---------+---------+
|  arr[0] |  arr[1] |  arr[2] |
|   10    |   20    |   30    |
+---------+---------+---------+
    ↑
    p, arr, &arr[0]
```

Pointer arithmetic:

* `p`     → arr[0]
* `p + 1` → arr[1]
* `p + 2` → arr[2]

---

# 🔥 10. Key Points (Quick Revision)

* Array name = pointer to first element
* `arr[i]` == `*(arr + i)`
* Pointers move by element size
* Arrays are fixed, pointers are flexible
* Only apply pointer arithmetic on arrays or malloc memory
* Accessing out-of-bounds is **undefined behavior**

---

# 🧠 Why It Matters (Real World)

Understanding array + pointer behavior is critical for:

* buffer overflows
* stack memory corruption
* heap overflows
* pointer misalignment
* exploit development
* ROP chain building
* memory forensics
* malware analysis


