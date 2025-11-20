# **🔹 Level 1 — Basics (warm-up)**

### **1️⃣ Print elements using pointer only (no arr[i])**

Given:

```c
int arr[5] = {10, 20, 30, 40, 50};
```

Print all values using **pointer arithmetic only**:

```
*(arr + 0)
*(arr + 1)
...
```

---

### **2️⃣ Print addresses of all elements**

Use:

```
(arr + i)
```

---

### **3️⃣ Increment pointer through array**

Make this output:

```
10
20
30
40
50
```

Using:

```c
int *p = arr;
while(...) {
    ...
    p++;
}
```

---

# **🔹 Level 2 — Medium (brain-building)**

### **4️⃣ Find sum using pointer only**

Do **not** use `arr[i]` or indexes.

Only use:

```
*(ptr + i)
```

or

```
ptr++
```

---

### **5️⃣ Reverse print array using pointer**

Output:

```
50 40 30 20 10
```

Hint:

```c
int *end = arr + 4;
```

---

### **6️⃣ Modify array values using pointer arithmetic**

Given:

```c
int arr[3] = {1, 2, 3};
```

Multiply each value by 5 using pointer arithmetic only.

---

# **🔹 Level 3 — Advanced (real pointer mastery)**

### **7️⃣ Print array using `i[arr]` (reverse indexing)**

Weird but valid C:

```c
printf("%d", 2[arr]);   // same as arr[2]
```

Exercise:
Print entire array using `i[arr]`.

---

### **8️⃣ Write your own strlen() using char pointer**

Given:

```c
char s[] = "Ravindu";
```

Count characters using:

```
while (*p != '\0')
    p++;
```

---

### **9️⃣ Copy one array to another using pointers**

No indexing allowed.

Use only:

```c
*p1 = *p2;
p1++;
p2++;
```

---

# **🔹 Level 4 — Exploit-Dev Starter Exercises (🔥)**

### **🔟 Out-of-bounds exploration (safe version)**

Make array:

```c
int arr[2] = {10, 20};
```

Print:

```
arr[0]
arr[1]
*(arr + 2)
*(arr + 3)
```

Don’t assign values — only print.
You’ll see weird values → this teaches how memory corruption happens.

---

### **11️⃣ Pointer to pointer practice**

Given:

```c
int a = 10;
int *p = &a;
int **pp = &p;
```

Print 5 things:

* `a`
* `*p`
* `**pp`
* address of p
* address of pp

---

### **12️⃣ GDB challenge**

Write a program with array:

```c
int arr[4] = {1,2,3,4};
```

Run in gdb:

* print `&arr`
* print `arr`
* print `arr[2]`
* print `*(arr+2)`
* print `p arr`
* print memory around arr (`x/8wx &arr`)

This builds real exploit dev muscle.

---

# 🔥 If you want bro…

I can also generate:

* solutions
* memory diagrams
* GitHub-ready notes
* more exercises
* GDB versions of each exercise

Just tell me.
