# 🔥 Exploit Development Journey — Ravindu

Welcome to my personal exploit-development journey.  
This repository documents my full path from **C foundations → assembly → shellcode → reversing → exploit development**.

My goal is to build **real low-level mastery** — not theory, not shortcuts — but the actual skills used by exploit developers, security researchers, and advanced offensive engineers.

This repo shows exactly how I learn, break programs, analyze memory, and build exploits from scratch.

---

# 🧠 About Me

I’m **Ravindu**, a self-taught security engineer building deep expertise in:

- Memory corruption
- Binary exploitation
- Reverse engineering
- Shellcoding
- Low-level debugging
- Linux internals
- C + assembly fundamentals

I’m currently sharpening my path toward becoming a **professional exploit developer** by building small focused labs, debugging everything manually, and documenting every step.

---

# 🚀 Repository Structure

This repo is organized to show *serious progression* in exploit dev — not random code, not theory dumps.

### **1️⃣ C Foundations (`/c-foundations`)**
Short, powerful C programs demonstrating:
- pointers
- stack/heap memory
- buffer overflows
- format strings
- function pointers
- custom memory manipulation

Each subfolder contains:
- `code.c`
- `explanation.md`
- screenshots of compilation & output

---

### **2️⃣ GDB Labs (`/gdb-labs`)**
Hands-on debugging labs covering:
- stack frames
- registers
- breakpoints & watchpoints
- segmentation fault analysis
- binary segments (text/data/bss)
- stepping through function pointers

Each lab includes:
- `lab.md` with commands
- screenshots
- explanation of findings

---

### **3️⃣ Shellcode Labs (`/shellcode-labs`)**
Safe, educational shellcoding exercises:
- Hello world shellcode
- execve("/bin/sh") handcrafted shellcode
- syscall table exploration
- encoding/decoding shellcode
- stack-based injection demo

Contains:
- `.s` assembly file
- C loader
- raw shellcode
- GDB screenshots
- explanation

---

### **4️⃣ Mini Exploits (`/mini-exploits`)**
Small, intentionally vulnerable programs + exploits:
- stack overflow → control RIP
- ret2win (ROP basics)
- ret2libc
- format string exploit

Each includes:
- vulnerable `.c`
- exploit using Pwntools
- `explanation.md`
- debugger screenshots

---

### **5️⃣ Reverse Engineering (`/reverse-engineering`)**
Mini RE challenges:
- removing password checks
- analyzing compiled binaries
- reversing simple license verifications
- understanding functions via Ghidra

Includes:
- binaries (if allowed)
- ghidra screenshots
- `explanation.md`

---

### **6️⃣ CTF Writeups (`/ctf-writeups`)**
Organized into categories:

- ctf-writeups/
    - pwn/
    - reversing/
    - forensics/
    - misc/


Writeups include:
- challenge description
- approach
- enumeration & debugging steps
- payload
- final solve
- screenshots

---

# 📘 Notes (`/notes`)
My personal notes on:
- calling conventions  
- ELF internals  
- stack frames  
- heap internals  
- registers  
- system calls  
- memory layout  

These show my increasing internal understanding of how binaries actually behave.

---

# 🧩 Resources (`/resources`)
Cheat sheets, references, PDFs, and helpful knowledge I collect while studying exploit development.

---

# 🛠️ Skills Demonstrated

### **Programming**
- C (core language for exploit dev)
- Assembly (Intel + AT&T)
- Python (Pwntools)
- Bash

### **Debugging / Analysis**
- GDB
- Radare2
- Ghidra
- objdump / readelf / nm
- Strace / Ltrace
- Valgrind

### **Exploit-Dev Concepts**
- stack overflows  
- heap basics  
- ret2libc  
- ROP chains  
- system calls  
- shellcode crafting  
- format string vulnerabilities  

---

# 🧰 Tools I Use

| Tool | Purpose |
|------|---------|
| **gdb + peda/pwndbg** | debugging & exploit dev |
| **radare2** | binary analysis |
| **ghidra** | reverse engineering |
| **gcc/clang** | compiling |
| **Pwntools** | exploit automation |
| **objdump / readelf** | ELF analysis |
| **Make** | building C labs |

---



# 📞 Contact

If you want to collaborate, hire me, or discuss exploit dev:

**Email:** ravinducodelza@gmail.com  
**GitHub:** github.com/Ravindu  
**LinkedIn:** (optional)

---

# ⭐ Final Note

This repository is not just a project —  
it is my **training ground** for becoming a high-level exploit developer.

Every folder represents real understanding,  
every screenshot shows my process,  
every writeup proves my thinking.

If you’re reviewing this as a company:  
I love solving hard problems, debugging memory issues,  
and building exploits from scratch.

