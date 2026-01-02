# Lab 06 — Register Recycling & Dirty Context execve

Up to Lab 05, construction techniques assumed a **mostly clean execution context**.
Registers were zeroed explicitly, syscall numbers were loaded directly, and argument pointers were computed in one step.

Lab 06 removes those assumptions.

This lab series focuses on **using what already exists** — registers, stack state, and instruction side-effects — instead of resetting everything.

This reflects **real exploit conditions**, where registers are rarely clean.

---

### Lab 06.1 — Dirty Context Baseline

Introduces execution under a **non-clean register state**.

#### Focus

* Registers may contain garbage
* Stack is writable
* No blanket `xor reg, reg` cleanup
* Minimal assumptions

Goal remains:

```
execve("/bin//sh", NULL, NULL)
```

This lab establishes a baseline for working inside uncertainty.

---

### Lab 06.2 — Partial Zero Knowledge

Only **one known-zero source** exists.

#### Constraints

* Only one register is guaranteed zero
  *(or zero is derived indirectly)*
* All other registers are unknown
* Stack is the only reliable memory

#### Focus

* Deriving arguments indirectly
* Recycling registers via `push/pop`, side effects
* Thinking under tight constraints

This lab trains **derivation**, not initialization.

---

### Lab 06.3 — Syscall Number Recycling

Removes direct syscall loading.

#### Constraints

* No `mov rax, 59`
* Syscall number must be derived indirectly

#### Focus

* Arithmetic construction
* Increment/decrement chains
* Reusing existing values
* Size-aware instruction choices

The goal is to **arrive at the syscall**, not load it.

---

### Lab 06.4 — Stack-Only Pointer Construction

Direct pointer computation is forbidden.

#### Constraints

* No `mov rdi, rsp`
* No `lea rdi, [rsp]`
* No single-instruction pointer assignment

#### Focus

* Stack-based pointer recycling
* Address discovery via push/pop chains
* Understanding stack layout evolution

This lab forces **spatial awareness**, not shortcuts.

---

### Lab 06.5 — Argument Pointer Recycling

Final lab in the series.

#### Constraints

* Registers start dirty
* Syscall number derived
* Argument pointers built indirectly
* `argv` must be a valid pointer array
* No one-step pointer setup

#### Focus

* Correct `argv` semantics (`char *argv[]`)
* Building pointer arrays on the stack
* Minimal instruction count
* Correct memory relationships, not just values

This lab proves **full execve correctness**, not just shell spawning luck.

---

## Conceptual Shift After Lab 06

At this point:

* We no longer *construct values*
* We **derive state**
* We stop assuming help from the environment
* We think like the target is hostile

This is the mental transition from:

> “writing shellcode”
> to
> “surviving inside a process”

---

