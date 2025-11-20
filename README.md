# 🔥 Exploit Development Journey

Welcome to my personal exploit-development journey.
This repository documents my full path from **C fundamentals → assembly → shellcode → reversing → exploit development**.

My goal is **true low-level mastery** — not tutorials, not theory — but the exact skills used by exploit developers, security researchers, and offensive engineers.

This repo captures how I break programs, study memory, debug binaries, and build exploits from zero.

---

## 🧠 About Me

I’m **Ravindu**, a self-taught security engineer focused on:

* Memory corruption & binary exploitation
* Reverse engineering
* Shellcoding & syscall-level programming
* Low-level debugging
* Linux internals
* C + assembly mastery

I’m currently sharpening my skills to become a **professional exploit developer**, building focused labs, breaking everything manually, and documenting every step.

---

## 🚀 Repository Structure

This repo is organized to show **solid, real progression** — not random exercises.

---

### **1️⃣ C Foundations (`/c-foundations`)**

Short, powerful C programs demonstrating:

* pointers
* dynamic memory
* stack vs heap
* buffer overflows
* function pointers
* custom memory manipulation

Each folder includes:

* `code.c`
* `explanation.md`
* screenshots of compilation/runtime

---

### **2️⃣ GDB Labs (`/gdb-labs`)**

Hands-on labs focused on:

* stack frames & calling conventions
* registers
* breakpoints / watchpoints
* segmentation faults
* memory segments (text/data/bss)
* stepping through vulnerable functions

Includes:

* `lab.md`
* screenshots
* explanations

---

### **3️⃣ Shellcode Labs (`/shellcode-labs`)**

Safe, educational shellcode practice:

* basic shellcode
* handcrafted execve("/bin/sh")
* syscall table exploration
* shellcode encoding/decoding
* stack-injection demos

Includes:

* `.s` assembly
* C loader
* raw shellcode
* GDB screenshots
* explanations

---

### **4️⃣ Mini Exploits (`/mini-exploits`)**

Small vulnerable programs + exploits:

* stack overflow → RIP control
* ret2win
* ret2libc
* format string attacks

Each includes:

* vulnerable C code
* exploit (Pwntools)
* `explanation.md`
* debugger screenshots

---

### **5️⃣ Reverse Engineering (`/reverse-engineering`)**

Mini RE challenges:

* removing password checks
* analyzing compiled binaries
* reversing simple licenses
* Ghidra-based function analysis

Includes:

* binaries (when allowed)
* Ghidra screenshots
* explanations

---

### **6️⃣ CTF Writeups (`/ctf-writeups`)**

Organized by category:

```
ctf-writeups/
    pwn/
    reversing/
    forensics/
    misc/
```

Writeups contain:

* approach
* enumeration
* debugging path
* final payload
* screenshots

---

## 📘 Notes (`/notes`)

My personal study notes on:

* calling conventions
* ELF internals
* stack/heap internals
* registers
* syscall flow
* memory layout

---

## 🛠 Skills Demonstrated

### **Programming**

* C
* Assembly (AT&T + Intel)
* Python (Pwntools)
* Bash

### **Debugging / Analysis**

* GDB
* Radare2
* Ghidra
* strace/ltrace
* objdump/readelf
* Valgrind

### **Exploit Dev Concepts**

* stack overflows
* heap basics
* ret2libc
* ROP chains
* shellcode crafting
* format string vulnerabilities

---

## 🧰 Tools I Use

| Tool              | Purpose         |
| ----------------- | --------------- |
| gdb + peda/pwndbg | debugging       |
| radare2           | binary analysis |
| ghidra            | RE              |
| gcc/clang         | compile labs    |
| Pwntools          | automation      |
| objdump / readelf | ELF inspection  |
| Make              | building labs   |

---

## 📞 Contact

If you want to collaborate, hire me, or discuss exploit development:

**Email:** [h.h.a.r.p.premachandra@gmail.com](mailto:h.h.a.r.p.premachandra@gmail.com)\
**GitHub:** [github.com/Ravindu](https://github.com/Ravindu-Priyankara)


---

## ⭐ Final Note

This repository is my **training ground** for becoming an advanced exploit developer.

Every folder shows real understanding.
Every screenshot shows the process.
Every writeup shows how I think.

If you’re a recruiter or company:
I specialize in **breaking binaries, debugging memory, and crafting exploits from scratch**.


