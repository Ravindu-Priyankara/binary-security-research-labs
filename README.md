# Low‑Level Security & Malware Analysis Journey

Welcome to my personal **low‑level security research journey**.

This repository documents my hands‑on work in **malware analysis, reverse engineering, binary patching, and exploit‑development fundamentals**, built from the ground up using **C, x86‑64 assembly, and GDB** on Linux.

The focus of this repo is **real binary behavior**  — but how unknown or protected binaries execute, defend themselves, and can be analyzed or neutralized at runtime.

---

## About Me

I’m **Ravindu**, a self‑taught security researcher focused on:

* malware analysis & binary behavior
* reverse engineering (Linux ELF)
* anti‑debug & anti‑analysis bypass
* logic patching & control‑flow modification
* low‑level debugging with GDB
* memory protection mechanisms (PIE, NX, ASLR, canaries)

I work close to the system using **C and x86‑64 assembly**, studying binaries at the instruction level to understand *how they really work* — and how their behavior can be safely modified or controlled.

My long‑term trajectory includes **exploit development**, but my current priority is building **strong malware analysis and reversing fundamentals**, which are transferable across platforms and real‑world security research environments.

---

## What This Repository Represents

This repository shows:

* how I analyze binaries without source
* how I bypass defensive checks
* how I patch logic safely
* how I reason about runtime behavior
* how I validate changes through debugging

Minimal notes.
Clear intent.
Proof‑driven work.

---

## Repository Structure

The repo is structured by **skill domain**, not by hype.

---

### GDB & Runtime Analysis (`/gdb-labs`)

Hands‑on labs focused on **runtime inspection, patching, and control** using GDB.

**Key areas covered:**

```
gdb-labs/
├── 01_bypassing_a_conditional_check
│
├── GDB + PIE Debugging Practice Lab_02
│   ├── lab_01
│   ├── lab_02
│   └── lab_03
│
├── lab_03_Memory_patching(GDB)
│   ├── lab_01_Patch_Variables_at_Runtime_(Data Patching)
│   ├── lab_02_Patch_Instructions_(Code Patching)
│   ├── lab_03_Patch_Control_Flow_(Advanced)
│   ├── lab_04_Memory_Analysis_&_Dumping
│   └── lab_05_Dynamic_Memory_&_Patching
│
├── lab_04_Stack_canary_bypass
│   ├── lab_01_Canary_Bypass_via_Flag_Manipulation(GDB)
│   ├── lab_02_Stack_Canary_Identification
│   ├── lab_03_Format_String_Canary_Leak
│   ├── lab_04_Canary-Preserving_Overflow
│   └── lab_05_Format_String_exploit
│
├── lab_05_NX_Bypass_Series
│   ├── lab_01_RIP_Control_Proof_(64-bit)
│   ├── lab_02_ret2win(NX enabled)
│   ├── lab_03_NX_Bypass_via_ret2libc(system)
│   └── lab_04_ret2libc_with_leak_first(ASLR-safe)
```

This folder demonstrates **confidence inside the debugger**, not scripted exploitation.

---

### Reverse Engineering (`/reversing-labs`)

Focused reverse‑engineering labs on Linux ELF binaries.

**Topics include:**

```
reversing-labs/
├── lab01_basic_reversing
│   └── lab01_hello_world_analysis
│
├── lab02_control_flow
│   ├── lab02_1_simple_branching
│   ├── lab02_2_optimized_conditions
│   ├── lab02_3_pie_runtime_control
│   └── lab02_4_obfuscated_control_flow
│ 
├── lab_03_Anti_Debugging_labs
│   ├── lab_01_Ptrace_Check(Anti-Debugging)
│   ├── lab_02_TracerPid_check
│   ├── lab_03_Timming-Based_Anti-Debugging
│   ├── lab_04_INT3_(SIGTRAP)_Anti-Debugging_Check
│   ├── lab_05_Syscall_Breakpoint_Detection_Check
│   ├── lab_06_Hardware_Breakpoint_Detection(DR0-DR7)
│   └── lab_07_RDTSC_Timming_Detection
│ 
├── lab_04_Self_Modifying_Malware
│   ├── lab_01_runtime_decryption
│   ├── lab_02_Self-Patching_Control_Flow(Runtime Code Rewrite)
│   ├── lab_03_Staged_Self-Decryption_with_Opaque_Predicate_&_Debugger_Trap
│   ├── lab_04_Payload_Discovery_&_Runtime_Analysis_Notes
│   
```

The emphasis is on **understanding and neutralizing analysis resistance**, not solving puzzles.

---

### Shellcode Engineering (`/shellcode-labs`)

Low-level **x86-64 Linux shellcode development labs**, focused on:

* syscall-level execution
* size and byte-level optimization
* stack-based data construction
* register hygiene & side-effects
* exploit-grade constraints (null bytes, control, stability)

These labs bridge **reverse engineering → exploitation**, reinforcing how instructions behave *inside real memory*.

```
shellcode-labs/
├── Lab_01_exit_shellcode
│   ├── v1-safe
│   ├── v2-short-but-buggy
│   └── v3-exploit-grade
│
├── Lab_02_Linux_x86_64_write_shellcode_optimization
│   ├── v1-readable
│   └── v2-optimized
│
├── lab_03_Stack_tricks
│   ├── lab_01_stack_based_string_construction
│   ├── lab_02_stack_string_synthesis_bytewise
│   └── lab_03_register_hygiene_vs_partial_writes
│ 
├── lab_04_Control_Flow_Primitives
│   ├── lab_01_RIP_Relative_Addressing
│   ├── lab_02_Call_Pop_Self_Location
│   ├── lab_03_Jump_Logic_and_Loops
│   └── lab_04_Position_Independent_Data_Access
│
├── lab_05_Shell_Spawn_Primitives
│   ├── lab_01_execve_minimal_shellcode
│   ├── lab_02_manual_XOR_encoding
│   ├── lab_03_XOR_decoded_stack_string (manual)
│   ├── lab_04_Arithmetic_String_Construction
│   └── lab_05_Partial_String_Construction_+_Rotation
│
├── lab_06_Register_Recycling
│   ├── lab_01_Dirty_Context_execve 
│   ├── lab_02_Partial_Zero_Knowledge_execve 
│   ├── lab_03_register_recycling_no_immediates 
│   ├── lab_04_Syscall_Number_Recycling(Dirty Context)
│   └── lab_05_Argument_Pointer_Recycling
```

Purpose: **build shellcode with intent**, not copy payloads.

---

### 🦠 Malware Analysis & Neutralization (`/malware-neutralization`)

This directory represents a **dedicated malware‑analysis track**.

Focus:

* hostile or “void” binaries
* behavior‑based analysis
* environment & debugger detection
* trigger removal
* logic neutralization
* patching malware functionality without breaking execution

This section reflects **real malware research workflows**, not academic exercises.

---

### Exploitation Primitives (`/exploitation-primitives`)

Supporting labs for exploit‑development fundamentals.

Includes:

* RIP control proof
* ret2win
* ret2libc (NX enabled)
* ASLR‑safe exploitation concepts
* stack canary handling

These labs exist to **support understanding**, not to dominate the repo.

---

## Tools & Environment

* **GDB** (primary analysis tool)
* Radare2
* Ghidra
* objdump / readelf
* strace / ltrace
* gcc / clang
* Linux (ELF binaries)

Tool usage is secondary to **reasoning and control**.

---

## Skills Demonstrated

* Malware Analysis (Linux ELF)
* Reverse Engineering
* Binary Patching
* Anti‑Debug & Anti‑Analysis Bypass
* Runtime Memory Analysis
* Low‑Level Debugging
* C & x86‑64 Assembly
* Exploit‑Development Fundamentals

---

## Notes on Documentation Style

* Notes are **minimal by design**
* Labs focus on *what was done* and *why*
* Proof is shown via debugger output and runtime evidence
* This repo reflects **how I think**, not how I teach

---

## Contact

**GitHub:** [https://github.com/Ravindu-Priyankara](https://github.com/Ravindu-Priyankara)\
**Email:** [h.h.a.r.p.premachandra@gmail.com](mailto:h.h.a.r.p.premachandra@gmail.com)

---

## Final Note

This repository is my **training ground for professional malware analysis and low‑level security research**.

It demonstrates:

* calm analysis under hostile conditions
* precise reasoning
* controlled modification of binaries
* deep familiarity with runtime behavior

Exploit development remains a **long‑term specialization**, but malware analysis and reversing are the **current focus and strength**.

---