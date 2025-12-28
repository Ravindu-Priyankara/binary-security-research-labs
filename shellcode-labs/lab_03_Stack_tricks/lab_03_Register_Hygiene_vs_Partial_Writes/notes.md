# Lab 03.3 — Register Hygiene vs Partial Writes

## Core Lesson

Shellcode failures that *look like* stack or alignment issues are often caused by **partial register writes**.

Linux syscalls read the **entire `RAX` register**, not just `AL`.

---

### ❌ The Bug

Using:

```asm
mov al, 59
```

Only updates the **lowest 8 bits** of `RAX`.

If `RAX` previously contained a negative value:

```
RAX = 0xfffffffffffffff3
```

After `mov al, 59`:

```
RAX = 0xffffffffffffff3b
```

* Syscall number is still **negative**
* Kernel rejects it
* Execution falls through into garbage instructions (`add byte ptr [rax], al`)
* SIGSEGV

---

### ✅ The Fix

Force a **full-register overwrite**:

```asm
push 59
pop rax
```

This guarantees:

```
RAX = 0x3b
```

No contamination. Syscall succeeds.

---

## Important Clarification

* This issue is **NOT** caused by stack alignment
* Linux syscalls **do not require 16-byte alignment**
* The failure was due to **register state contamination**

---

### Key Insight

> Register hygiene matters more than clever tricks.
> Partial writes are silent exploit killers.

---

## Skills Trained

* Linux x86-64 syscall ABI
* Partial vs full register writes
* Debugging shellcode with GDB / pwndbg
* Stack-based string construction
* Diagnosing syscall failures at register level

---