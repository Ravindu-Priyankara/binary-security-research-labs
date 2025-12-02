# **Stack Frames(x86‑64)**

## **Stack Grows Down**

Memory goes:

```
High Address
↓
| ...        |
| arguments  |
| return RIP |
| saved RBP  |
| locals     |
| buffer[]   |
↑
Low Address (stack grows down)
```

---

# **Function Prologue**

```asm
push rbp
mov rbp, rsp
sub rsp, <localsize>
```

Meaning:

* **save old stack frame**
* **create new frame**
* **reserve space for locals**

---

# **Function Epilogue**

```asm
leave   ; mov rsp, rbp + pop rbp
ret     ; pop RIP from stack
```

---

# **Offset Formula**

```
buffer → starts at [rbp - <size>]
saved RBP → at [rbp]
return RIP → at [rbp + 8]
```

So if you have:

```c
char buf[32];
```

Offsets:

```
buf:       rbp - 32
saved RBP: rbp
return RIP: rbp + 8
```

Overflow distance to RIP:

```
32 (buffer)
+ 8 (saved RBP)
= 40 bytes total
```

This is why almost EVERY ret2win challenge uses `40` bytes in x86‑64.

---

# **Stack Frame Example — Visual**

```
(rbp+16)   3rd argument
(rbp+8)    return RIP  ← overwrite this
(rbp)      saved RBP
(rbp-8)    local var
(rbp-32)   char buf[32] ← overflow starts here
(rbp-40)   more locals
```

---

# **Exploit Memory Access**

### ✔ Read local variable:

```asm
mov rax, [rbp-8]
```

### ✔ Read function argument (stored on stack):

```asm
mov rdi, [rbp+16]
```

### ✔ Overwrite RIP (in exploit):

```
"A" * (buffer_size + 8) + <address>
```

---

# **How a Return Works**

RET does:

```asm
pop rip
```

Meaning:
Whatever 8 bytes are at `[rsp]` become the next instruction.

So if you overflow and put:

```
padding + saved RBP + 0x401176
```

Then `ret` → jumps to `0x401176`

This is the heart of ret2win exploitation.

---

# **Stack Diagram With Addresses**

```
...  HIGH ADDR
0x7fffffffe120  arg 3
0x7fffffffe118  return RIP   ← overwrite target
0x7fffffffe110  saved RBP
0x7fffffffe0f0  buffer[32]   ← write from here
0x7fffffffe0d0  more locals
...  LOW ADDR
```

---

# **Common Offsets in Real Exploits**

| Type            | Offset |
| --------------- | ------ |
| 32‑byte buffer  | 40     |
| 64‑byte buffer  | 72     |
| 128‑byte buffer | 136    |
| 256‑byte buffer | 264    |

Formula:

```
offset = buffer_size + 8
```

Every time.

---

# **Stack Frames in C → Assembly Example**

C code:

```c
void func() {
    char buf[32];
}
```

Assembly:

```asm
push rbp
mov rbp, rsp
sub rsp, 32
```

Offsets:

```
rbp-32 → buf
rbp    → saved RBP
rbp+8  → return RIP
```

---