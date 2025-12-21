# **Anti-Debugging Reversing Labs (Lab03)**

This directory contains focused labs exploring **real-world anti-debugging techniques used in native Linux binaries**, analyzed and defeated using **manual reasoning and runtime proof** with **radare2**.

The goal is to understand anti-debugging **as a system**, not as isolated tricks — from syscall behavior and kernel artifacts to timing abuse and CPU debug registers.

These labs emphasize **runtime truth**, **execution control**, and **proof-based bypasses**, not theory, signatures, or automation.

---

## **Lab Structure**

```

lab03_1_ptrace_check
lab03_2_tracerpid_procfs
lab03_3_loop_delay_detection
lab03_4_int3_signal_trap
lab03_5_syscall_breakpoint_detection
lab03_6_hardware_breakpoint_detection
lab03_7_rdtsc_timing_detection

```

Each lab introduces a **stronger assumption about “debugger presence”**, then forces the analyst to **break that assumption using reality**.

---

## **Lab03.1 — ptrace(PTRACE_TRACEME) Check**

Introduces the most common anti-debugging primitive.

### Focus

* `ptrace(PTRACE_TRACEME)` behavior
* Return value semantics (`-1`, `EPERM`)
* Why ptrace is a *one-time contract*
* Branch-based enforcement
* Runtime vs permanent bypass

---

## **Lab03.2 — TracerPid Check (`/proc/self/status`)**

Moves detection from syscalls to **kernel-exposed process metadata**.

### Focus

* `/proc/self/status` parsing
* `TracerPid` semantics
* Why this check is passive but reliable
* String parsing vs numeric comparison
* Redirecting trust, not removing logic

---

## **Lab03.3 — Loop-Based Delay Detection**

Introduces **time amplification via execution delay**, without timers.

### Focus

* Artificial loop inflation
* Register-based counters
* Stack variable comparison abuse
* Why debuggers amplify execution cost
* Bypassing *effects*, not instructions

---

## **Lab03.4 — INT3 Signal Trap Detection**

Demonstrates debugger detection via **intentional breakpoint faults**.

### Focus

* `int3` instruction behavior
* `SIGTRAP` handling
* Signal handler manipulation
* Detecting debugger interception vs program control
* Patch strategies that preserve behavior

---

## **Lab03.5 — Syscall Breakpoint Detection**

Explores detection via **syscall repetition and consistency**, not ptrace.

### Focus

* Raw syscalls (`getpid`)
* Loop-based syscall comparison
* Why this fails under breakpoints
* Performance vs correctness tradeoffs
* Loop termination as a bypass vector

---

## **Lab03.6 — Hardware Breakpoint Detection (DR0–DR7)**

Moves detection into **CPU debug registers**, beyond software breakpoints.

### Focus

* `mov reg, drX` semantics
* Privilege-level behavior
* Why naïve access crashes
* Signal-safe detection logic
* Control-flow neutralization without NOPs

---

## **Lab03.7 — RDTSC Timing Detection**

Final lab: **high-resolution CPU timing abuse**.

### Focus

* `RDTSC` behavior
* Cycle-accurate delay measurement
* Loop + timing compound detection
* Why debuggers cannot hide time
* Forcing correctness without faking time

---

## **Analysis Model Progression**

```

ptrace trust
→ kernel metadata trust
→ signal interception trust
→ execution speed trust
→ syscall consistency trust
→ CPU debug state trust
→ raw timing trust

```

Each lab **removes another illusion of safety** from the defender’s perspective.

---

## **Conventions**

Each lab contains:

* `notes.md` with **proof-based observations**
* One confirmed bypass (runtime and/or permanent)
* Source code or compiled binary
* radare2-only workflow

No automated frameworks.  
No symbolic execution.  
No debugger hiding tricks.

---

## **What This Series Is (and Is Not)**

✔ Anti-debugging in real binaries  
✔ Runtime behavior analysis  
✔ CPU + kernel interaction  
✔ Manual patching discipline  
✔ Malware-grade logic understanding  

✘ Exploitation  
✘ Shellcoding  
✘ Obfuscation theory  
✘ Tool-based bypass gimmicks  

Those belong to **later lab series**.

---

## **Outcome**

After completing Lab03, the analyst can:

* Recognize anti-debugging **by behavior**, not signatures
* Identify *where* trust is assumed
* Decide *what* must be neutralized
* Bypass detection without breaking logic
* Preserve binary functionality
* Prove control under observation

Anti-debugging is not about hiding.  
It is about **who controls execution**.

---

> We never teach.  
> We never assume.  
> We observe, control, and prove.

---