section .data
    msg db "Hello World!", 0x0A     ; Message + newline
    msg_len equ $ - msg             ; Calculate message length

section .text
global _start

_start:
    mov rax, 1                      ; sys_write
    mov rdi, 1                      ; stdout (file descriptor 1)
    mov rsi, msg                    ; Pointer to message
    mov rdx, msg_len                ; Message length
    syscall

    mov rax, 60                     ; sys_exit
    mov rdi, 0                      ; Exit code 0
    syscall