# **Dynamic Memory Allocation (C)**

## **🔥 Memory Layout (Linux Process Memory)**

```
|---------------------|
|       Heap          |  <-- grows upward (malloc/free/realloc)
|---------------------|
|       Stack         |  <-- grows downward (local vars, return addresses)
|---------------------|
|   Static / Global   |  (.data / .bss)
|---------------------|
|       Code          |  (text segment, instructions)
|---------------------|
```

---

## **1️⃣ malloc() — Allocate Raw Heap Memory**

```c
int *ptr = malloc(sizeof(int));
```

* Allocates memory on the **heap**
* Returns **void*** (you don’t need to cast in C)
* Contains **garbage values**
* You must `free()` it later

### Bigger allocation

```c
int *arr = malloc(200 * sizeof(int));
```

---

## **2️⃣ Using malloc() + accessing memory**

```c
int *p = malloc(sizeof(int));
*p = 10;

printf("%d\n", *p);
free(p);
```

⚠️ **Never `free(&p)` — that is freeing the pointer’s address, not the heap block.**
Correct:

```c
free(p); // not &p
```

---

## **3️⃣ Accessing malloc’d arrays**

```c
int *point = malloc(3 * sizeof(int));

point[0] = 1;        // *(point + 0)
point[1] = 2;        // *(point + 1)
point[2] = 3;        // *(point + 2)
```

---

## **4️⃣ calloc() — Zero-Initialized Memory**

```c
int *point = calloc(200, sizeof(int));
```

### malloc vs calloc

| Function   | Initializes memory?  | Speed           |
| ---------- | -------------------- | --------------- |
| **malloc** | ❌ No (garbage)       | Faster          |
| **calloc** | ✔ Yes (fills with 0) | Slightly slower |

---

## **5️⃣ realloc() — Resize Heap Block**

```c
int *pointer = malloc(5 * sizeof(int));
int *b = realloc(pointer, 10 * sizeof(int));
```

### Important rules:

* If expanding → may **move** block to new location
* If shrinks → leftover memory becomes free inside arena
* Always assign to **temporary pointer**, NOT directly original one

✔ Safe pattern:

```c
int *tmp = realloc(pointer, new_size);

if (tmp == NULL) {
    // realloc failed → original pointer still valid
    // handle error
} else {
    pointer = tmp; // safe update
}
```

---

## **6️⃣ Common Pitfalls (Exploit-Dev Critical)**

### ❌ Double free

```c
free(ptr);
free(ptr);   // dangerous
```

### ❌ Use-after-free (UAF)

```c
free(ptr);
*ptr = 10;   // memory is invalid
```

### ❌ Memory leak

When you lose reference to allocated memory:

```c
ptr = malloc(10);
ptr = malloc(20); // lost the previous block → leak
```

### ❌ Freeing invalid memory

```c
int a = 10;
free(&a);  // ERROR
```

---

## **7️⃣ Real Heap Concepts Needed for Exploit Dev**

* **Heap chunks** (metadata + user area)
* **Bin types** → fastbin, smallbin, unsorted, tcache
* **Overwriting chunk size to control free()**
* **tcache poisoning**
* **House of Force / House of Spirit**
* **Allocations with glibc ptmalloc2**
* Heap grooming (shaping layout before exploitation)

These will matter when you do:

* UAF → arbitrary write
* tcache poisoning → malloc returns controlled pointer
* Heap overflows → corrupt next chunk metadata

---

## **8️⃣ Example: realloc doubling array**

```c
int *arr = malloc(5 * sizeof(int));

for (int i = 0; i < 5; i++)
    arr[i] = i + 1;

int *tmp = realloc(arr, 10 * sizeof(int));
if (tmp) arr = tmp;
```

---

## 🔥 Summary 

* **malloc** → fast, uninitialized
* **calloc** → slow, zeroed
* **realloc** → resize, may move chunk
* Heap memory must be **freed exactly once**
* Don’t use memory after freeing
* Don’t free stack or global variables
* Understanding chunk metadata → mandatory for exploit dev

---