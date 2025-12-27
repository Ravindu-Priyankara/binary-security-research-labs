# **Reverse Engineering Labs (radare2)**

This repository contains hands-on **binary reverse engineering labs** completed using
**radare2 and manual analysis** on ELF binaries.

The focus is on **understanding how binaries actually behave**, not tool automation, CTF shortcuts, or copy‑paste workflows.

These labs are built to train **control flow reasoning, compiler awareness, and runtime truth**, forming a solid base for exploitation, malware analysis, and low‑level security research.

---

## **Repository Structure**

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

---

## **Skills Trained**

* Control-flow reasoning under real execution (`cmp`, `test`, `jcc`, `cmov`)
* Register- and flag-driven decision analysis
* PIE & ASLR runtime awareness
* Distinguishing static assumptions from runtime truth
* Manual runtime patching (register, stack, memory)
* Permanent binary patching with behavioral preservation
* Anti-debugging mechanism analysis and neutralization
* Kernel and CPU interaction awareness (ptrace, signals, debug registers)
* Timing and execution-cost based detection analysis
* Loop, syscall, and signal-based logic inspection
* radare2-centric reversing workflows
* Proof-based validation of bypasses
* Low-level execution control mindset

---

## **Lab Conventions**

Each lab contains:

* `notes.md` with **concise technical observations**
* One proof run (log or screenshot)
* Source code or binary
* No automation frameworks
* No “magic” commands without understanding

Documentation is intentionally minimal to reflect **real-world reversing workflows**, not tutorials.

---

## **Tools Used**

* radare2
* rabin2
* r2pipe
* objdump
* readelf
* strings
* nm
* gcc (various optimization levels)
* checksec
* hexdump / xxd
* diff / cmp
* rax2

---

## **Goal**

Build a **deep, correct mental model** of how binaries work — so that:

* exploitation becomes logical, not memorized
* protections make sense
* tools become extensions of thinking, not crutches

This repository is designed to produce **real reverse engineers**, not tool operators.

---