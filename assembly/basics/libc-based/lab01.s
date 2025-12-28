section .data
        msg db "AAAA"

section .text
global _start
extern puts

_start:
        push rax
        push 0x41414141      ; stack math fixed

        mov rdi, msg
        call puts

        mov eax, 60
        xor edi, edi
        syscall


; nasm -f elf64 -o lab01.o lab01.s
; gcc -nostartfiles -no-pie -o lab01 lab01.o

; or change _start => main and just compile with gcc