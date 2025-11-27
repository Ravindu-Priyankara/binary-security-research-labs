```asm
DB  = Define Byte      (1 byte)
DW  = Define Word      (2 bytes)
DD  = Define Dword     (4 bytes)
DQ  = Define Qword     (8 bytes)

Usage:
- DB: strings, shellcode bytes
- DW: 16-bit values
- DD: 32-bit values, 32-bit pointers
- DQ: 64-bit values, ROP gadget addresses, 64-bit pointers

Examples:
msg     db "Hello",0
num16   dw 0x1234
num32   dd 0x11223344
num64   dq 0x1122334455667788

Repeat:
buff    times 64 db 0
```