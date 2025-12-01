# **SysV x86‑64 Calling Convention (Linux)**

## **Function Arguments (IN ORDER)**

For Linux x64:

```
1st → RDI
2nd → RSI
3rd → RDX
4th → RCX
5th → R8
6th → R9
```

More than 6 → go on the *stack* at `[rsp + offset]`.

---

# **Return Value**

Always in:

```
RAX
```

If function returns struct or large object → pointer in RDI is used.

---

# **Caller‑Saved Registers (volatile)**


```
RAX
RCX
RDX
R8
R9
R10
R11
```

Called function is free to destroy them.

These are used heavily in ROP gadgets (especially RAX, RDI, RSI, RDX).

---

# **Callee‑Saved Registers (non‑volatile)**

Function must restore these before returning:

```
RBX
RBP
R12
R13
R14
R15
```

These stay preserved across calls.

---

# **Stack Alignment Rule**

Before a call instruction, RSP must be aligned to:

```
16-byte boundary
```

So the stack must satisfy:

```
RSP % 16 == 8    after pushing return address
```

This is why shellcode must often realign the stack.

---

# **Function Prologue & Epilogue (standard)**

### **Prologue**

```asm
push rbp
mov rbp, rsp
sub rsp, <localsize>
```

### **Epilogue**

```asm
leave    ; mov rsp, rbp + pop rbp
ret
```

---

# **Stack Layout During a Function Call**

```
HIGH ADDR
| arg 7          |
| arg 6 (R9)     |
| arg 5 (R8)     |
| arg 4 (RCX)    |
| arg 3 (RDX)    |
| arg 2 (RSI)    |
| arg 1 (RDI)    |
| return RIP     | ← ret jumps here
| saved RBP      |
| locals         |
| buffer[]       |
LOW ADDR
```

---

# **How a Function is Called**

Compiler prepares registers:

Example C:

```c
foo(1, 2, 3, 4, 5, 6);
```

Assembly:

```asm
mov r9, 6
mov r8, 5
mov rcx, 4
mov rdx, 3
mov rsi, 2
mov rdi, 1
call foo
```

---

# **Syscall Calling Convention (different!)**

For Linux syscalls:

```
RAX = syscall number
RDI = arg1
RSI = arg2
RDX = arg3
R10 = arg4
R8  = arg5
R9  = arg6
```

Then:

```asm
syscall
```

This is used for shellcode creation.

---