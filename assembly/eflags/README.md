# EFLAGS

## EFLAGS is a special CPU register that stores all the status flags of the processor.


### **What exactly is inside EFLAGS/RFLAGS? (Important ones only)**


| Flag   | Name           | Why it's important                  |
| ------ | -------------- | ----------------------------------- |
| **ZF** | Zero Flag      | Result = 0? (Used in CMP/JZ/JNZ)    |
| **CF** | Carry Flag     | Multi-byte arithmetic, borrow/carry |
| **OF** | Overflow Flag  | Signed overflow (CMP/JG/JL logic)   |
| **SF** | Sign Flag      | Result negative?                    |
| **PF** | Parity Flag    | Not very important                  |
| **IF** | Interrupt Flag | Allows hardware interrupts          |


### ZF (Zero Flag)

Used in conditional jumps:
`je`, `jne`, `jz`, `jnz`

### OF (Overflow Flag) and SF (Sign Flag)

Used when understanding signed comparisons.

---