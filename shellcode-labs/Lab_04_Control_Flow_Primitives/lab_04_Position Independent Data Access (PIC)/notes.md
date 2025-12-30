# Lab 04 — Position Independent Data Access (PIC)


## Purpose

Learn how to **access embedded data without hardcoded addresses**, using **position-independent code (PIC)** techniques required for real shellcode and egg hunters.

---

## Core Concept

Shellcode **cannot rely on fixed addresses**.
Instead, it must **discover its own location at runtime** and reference data relative to that location.

This lab demonstrates:

* JMP–CALL–POP technique
* Safe register recycling
* PIC-safe data iteration
* Avoiding broken registers after syscalls

---

## Key Techniques Used

### JMP–CALL–POP (Self-Location Discovery)

```asm
jmp short data_call
...
data_call:
    call code_start
    db "PIC DATA", 0
```

* `call` pushes the address of the data onto the stack
* `pop rsi` retrieves the runtime data address
* Works anywhere in memory (PIC-safe)

---

### Register Recycling (Critical Insight)

Registers are reused deliberately:

| Register | Role                                               |
| -------- | -------------------------------------------------- |
| RSI      | data pointer → syscall argument → restored pointer |
| AL       | data byte + NULL terminator check                  |
| RAX      | syscall number                                     |
| RDI      | stdout FD                                          |
| RDX      | write length                                       |

**No hardcoded addresses. No wasted registers.**

---

### Avoiding RSI Clobber After Syscall

Linux `syscall` **does not preserve RSI**.

Incorrect:

```asm
pop rsi
syscall
; RSI now unreliable
```

Correct:

* Rebuild RSI when needed
* Or move pointer logic around syscall usage

---

## Final Working Code (Optimized)

```asm
section .text
global _start

_start:
    jmp short data_call

code_start:
    pop rsi              ; RSI = data start

read_loop:
	lodsb                ; AL = [RSI], RSI++
    test al, al
    je done

    ; write(1, RSI-1, 1)
	push 1
	pop rax
    movzx edi, al
    lea rsi, [rsi-1]
    movzx edx, al
    syscall

    inc rsi              ; restore pointer
    jmp read_loop

done:
    jmp $

data_call:
    call code_start
    db "PIC DATA", 0

```

---

## Skills Gained

* Position-independent data access
* JMP–CALL–POP mastery
* Register recycling mindset
* Safe syscall register handling
* Egg-hunter-ready pointer logic

---

## Why This Lab Matters

> Egg hunters, polymorphic shellcode, and loaders **all depend on this pattern**.

If you can’t:

* find your own data
* recycle registers
* survive syscalls

You **cannot write real shellcode**.

---