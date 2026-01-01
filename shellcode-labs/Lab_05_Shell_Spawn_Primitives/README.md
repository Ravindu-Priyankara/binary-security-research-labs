# Shell Spawn Primitives — execve(`/bin//sh`) Without Strings

This directory contains focused labs exploring **how shellcode spawns a shell** under progressively tighter constraints.

The goal is **not exploitation** and **not networking**.
The goal is to understand how `/bin//sh` can be **constructed, hidden, mutated, and executed** using only raw instructions and minimal assumptions.

All labs end in the same syscall:

```
execve("/bin//sh", NULL, NULL)
```

What changes is **how we get there**.

---

## What These Labs Are *Not*

These labs intentionally avoid:

* Buffer overflows
* RIP hijacking
* Networking (reverse/bind shells)
* Egg hunters
* Encoders / packers
* libc or syscall wrappers

Those come later.

This directory is about **shell creation mechanics**, not delivery.

---

## Lab Structure

```
lab_01_execve_minimal_shellcode
lab_02_manual_XOR_encoding
lab_03_XOR_decoded_stack_string (manual)
lab_04_Arithmetic_String_Construction
lab_05_Partial_String_Construction_+_Rotation
```

Each lab introduces **one construction technique** and keeps everything else simple.

---

## Lab 01 — Minimal execve Shellcode

Baseline reference implementation.

### Focus

* Stack-based `/bin//sh`
* Direct `execve` syscall
* Clean register setup
* No obfuscation

Purpose:
This is the **control sample**.
Every later lab should still reduce to this behavior.

---

## Lab 02 — Manual XOR Encoding (Concept)

Introduces **XOR-based string hiding** conceptually.

### Focus

* Choosing an encoded constant
* Understanding XOR symmetry
* Observing why naïve XOR can fail
* Seeing incorrect output before fixing it

This lab exists to show **why XOR matters**, not to optimize it.

---

## Lab 03 — XOR-Decoded Stack String (Manual)

Correct XOR decoding done **in place on the stack**.

### Focus

* Encoded constant + XOR key
* `xor qword [rsp], reg`
* No ASCII string in shellcode bytes
* Decode happens only at runtime

Verification was done using:

* `cmp`
* `xxd`
* before/after memory comparison

Resulting runtime memory:

```
/bin//sh
```

---

## Lab 04 — Arithmetic String Construction

Constructs `/bin//sh` **byte-by-byte using arithmetic**, not constants.

### Focus

* No string constants
* No XOR
* Arithmetic derivation (`add`, `sub`, `imul`, `idiv`, `neg`)
* Writing directly into stack memory

Each byte is derived independently.

This trains:

* Fine-grained control
* Polymorphic construction
* Avoiding static signatures

---

## Lab 05 — Partial Construction + Rotation

Builds the string using **bit shifts and rotations** instead of arithmetic.

### Focus

* `shl`, `shr`, `rol`, `ror`
* Constructing bytes from non-obvious values
* Partial construction logic
* Byte-level placement on stack

No readable `/bin//sh` appears in:

* `.text`
* strings output
* static analysis

Runtime verification confirms correct memory state.

---

## Conceptual Progression

Across these labs:

* Strings move from **visible → hidden → derived**
* Construction shifts from **constants → transformations**
* Static signatures disappear
* Runtime behavior stays identical

This mirrors how real shellcode avoids detection without changing outcome.

---

## Conventions

Each lab contains:

* One focused technique
* Minimal assembly
* No macros or helpers
* Manual verification
* Notes written from analysis, not tutorials

If something breaks, it usually **runs incorrectly**, not crashes.

That is expected.

---

## Why This Matters

If you cannot:

* construct strings without embedding them
* mutate byte patterns
* reason about runtime memory state

then polymorphic shellcode and loaders will fail quietly.

This directory removes that weakness.

---

