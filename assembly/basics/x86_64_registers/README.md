# **x86-64 Registers**

## **General-Purpose Registers (64-bit)**

These are the CPU’s “fast pockets.”

| Register    | Meaning / Usage             | Used in Exploit Dev For                     |
| ----------- | --------------------------- | ------------------------------------------- |
| **RAX**     | Accumulator / return value  | Checking function returns, syscall number   |
| **RBX**     | Base register (general use) | Temporary storage in ROP chains             |
| **RCX**     | Counter register            | Loop counters, 4th syscall arg              |
| **RDX**     | Data register               | Function args, syscall args                 |
| **RSI**     | 2nd argument                | Setting args in ROP                         |
| **RDI**     | 1st argument                | Pointing to strings (like "/bin/sh")        |
| **R8**      | 5th argument                | Syscall/ROP                                 |
| **R9**      | 6th argument                | Syscall/ROP                                 |
| **R10–R11** | Temporary                   | Often destroyed by syscall, used in gadgets |
| **R12–R15** | Saved registers             | Great for chain stability                   |

---

## **Special Registers**

| Register          | Meaning / Usage     | Why it matters in exploits                              |
| ----------------- | ------------------- | ------------------------------------------------------- |
| **RIP**           | Instruction Pointer | Overwriting this = full control (stack overflow target) |
| **RSP**           | Stack Pointer       | ROP chains start here                                   |
| **RBP**           | Base Pointer        | Used for stack frame; often overwritten in BOF          |
| **EFLAGS/RFLAGS** | Flags               | Controls conditional jumps                              |

---

## **Register Sizes Breakdown**

| Size           | Registers |
| -------------- | --------- |
| **64-bit**     | RAX       |
| **32-bit**     | EAX       |
| **16-bit**     | AX        |
| **8-bit low**  | AL        |
| **8-bit high** | AH        |

Same layout for RBX/RCX/RDX.

### Important:

* Writing to **EAX clears upper 32 bits of RAX**
* Writing to **AX/AL/AH does NOT clear anything**
* AL → low byte
* AH → high byte

---