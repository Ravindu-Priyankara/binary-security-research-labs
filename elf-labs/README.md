# ELF Labs

This repository contains hands‑on experiments exploring the **Linux ELF format** from the loader’s point of view — not from tool output.

The focus is on **how ELF files become running processes**:
how headers control memory, how execution is chosen, and how malware and packers abuse those rules.

These are not tutorials.
They are **controlled experiments** against real ELF binaries.

---

## Repository Structure

```
elf-labs/
└── Lab_01_ELF_Identity_Fields
    ├── lab_01_ELF_Identity_Fields
    ├── lab_02_EI_CLASS_Is_Not_Truth
    ├── lab_03_EI_DATA_Corruption_Experiment
    ├── lab_04_e_machine_is_not_the_cpu
    ├── lab_05_Program_Headers_Define_Reality
    ├── lab_06_Program_Headers_define_execution
    ├── lab_07_e_entry_Is_Just_a_Pointer
    ├── lab_08_Memory_Permissions_Control_Execution
    └── lab_09_Section_Header_Identity
```

Each directory represents one **fundamental ELF truth** that most tools hide.

---

## What These Labs Teach

* How ELF identity fields lie
* Why headers matter more than file extensions
* How the kernel maps bytes into memory
* How execution really begins
* Why sections exist for humans — not the loader
* How packers and malware manipulate headers
* Why static tools are often wrong

This is **binary reality**, not textbook ELF.

---

## Mental Model

```
File bytes
→ ELF headers
→ Program headers
→ Virtual memory
→ Permissions
→ Entry point
→ Execution
```

Everything in these labs follows that chain.

---

## Lab Philosophy

Each lab is built around:

* One **single concept**
* One **binary**
* One **experiment**
* One **proof**

There is no automation, no scripts, and no frameworks.
You read headers, calculate offsets, and watch what the loader really does.

---

## Tools Used

* `readelf`
* `objdump`
* `xxd`
* `hexdump`
* `strings`
* `nm`
* `gcc`
* `ld`
* `python`
* `radare2`
* `gdb`

---

## Goal

Build a **loader‑level understanding** of Linux binaries to support:

* Malware analysis
* Packer reversing
* Exploit development
* Anti‑analysis research
* Custom loaders and shellcode

If you understand these labs, **no ELF trick can hide from you**.

---
