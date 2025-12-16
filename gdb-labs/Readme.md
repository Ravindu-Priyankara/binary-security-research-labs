# GDB Labs — Runtime Debugging & Control Flow

This repository contains hands-on **GDB practice labs** focused on runtime analysis, PIE debugging, memory inspection, and control-flow manipulation.

The labs are designed as **small, focused exercises** to build real debugger intuition rather than academic reversing theory.

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
│   ├── lab_05_Dynamic_Memory_&_Patching
│   └── README.md
├── lab_04_Stack_canary_bypass
```

---

## Lab Groups

### 01 — Bypassing a Conditional Check

Introductory labs focused on **logic bypassing** using GDB.

**Focus:**

* Conditional jumps
* Runtime value modification
* Basic control-flow influence

---

### 02 — GDB + PIE Debugging Practice

Labs focused on **Position Independent Executables (PIE)** and runtime address resolution.

**Structure:**

```
GDB + PIE Debugging Practice Lab_02/
├── lab_01
├── lab_02
└── lab_03
```

**Focus:**

* PIE base calculation
* Runtime address rebasing
* Breakpoints under ASLR
* Hidden function discovery

---

### 03 — Memory Patching (GDB)

Labs centered on **direct memory and instruction patching**.

**Contained Labs:**

* Patch variables at runtime (data patching)
* Patch instructions (code patching)
* Patch control flow (advanced)
* Memory analysis and dumping
* Dynamic memory & patching

**Focus:**

* Data vs instruction patching
* Stack and global memory
* Instruction pointer manipulation
* Runtime memory validation

---

## Lab Conventions

Each lab typically contains:

* Minimal `notes.md`
* One or more proof screenshots or logs
* Source code or compiled binary

The emphasis is on **clarity, correctness, and execution insight**.

---

## Scope

These labs are intended for:

* Reversing practice
* Exploit development foundations
* Debugger-driven analysis
* Safe experimentation in local or VM environments
