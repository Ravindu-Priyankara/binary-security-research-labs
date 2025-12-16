# GDB Labs

This repository contains hands-on binary debugging labs completed using
**GDB, objdump, and manual analysis** on ELF binaries.

The focus is on **practical understanding and pattern recognition**, not
academic-style reports or step-by-step tutorials.

---

## Repository Structure

```
gdb-labs/
├── 01_bypassing_a_conditional_check
├── GDB + PIE Debugging Practice Lab_02
│   ├── lab_01
│   ├── lab_02
│   └── lab_03
├── lab_03_Memory_patching(GDB)
│   ├── lab_01_Patch_Variables_at_Runtime_(Data Patching)
│   ├── lab_02_Patch_Instructions_(Code Patching)
│   ├── lab_03_Patch_Control_Flow_(Advanced)
│   ├── lab_04_Memory_Analysis_&_Dumping
│   └── lab_05_Dynamic_Memory_&_Patching
```

---

## Skills Trained

* Control flow analysis (`cmp` / `jcc`)
* Function discovery in stripped binaries
* String-based logic reversal
* Runtime patching using GDB
* Instruction and data manipulation
* Understanding compiler behavior and optimizations (PIE, ASLR)

---

## Lab Structure

Each lab folder contains:

* Minimal technical notes (key observations only)
* One proof screenshot (critical breakpoint or patch)
* Source code or binary used

Documentation is intentionally minimal to reflect **real-world reverse
engineering workflows**.

---

## Tools Used

* GDB
* objdump
* readelf
* gcc (various optimization levels)
* r2
* checksec
* ltrace
* strace
* nm
* strings
* objdump
* diff
* cmp

---

## Goal

Build strong debugging fundamentals as a foundation for:

* Exploit development
* CTF-style challenges
* Low-level security research
