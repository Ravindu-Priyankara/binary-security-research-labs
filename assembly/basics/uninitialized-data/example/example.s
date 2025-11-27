section .bss
    buffer resb 16          ; uninitialized memory (16 bytes)

section .data
    message db "HelloBSS", 0    ; initialized data

section .text
global _start

_start:
    ; copy message → buffer (8 bytes for demo)
    mov rax, [message]       ; load 8 bytes from .data
    mov [buffer], rax        ; store into .bss

    ; print buffer using write syscall
    mov rax, 1               ; sys_write
    mov rdi, 1               ; fd = stdout
    mov rsi, buffer          ; pointer to .bss data
    mov rdx, 8               ; length to print
    syscall

    ; exit
    mov rax, 60
    mov rdi, 0
    syscall

