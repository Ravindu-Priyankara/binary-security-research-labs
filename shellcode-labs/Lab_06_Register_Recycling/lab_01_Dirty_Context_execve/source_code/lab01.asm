section .text
global _start

_start:
        push 59
        pop rax                         ; rax = 59
        cdq                             ; edx = 0 (cdq = 32bit, cqo = 64bit)

        push rdx                        ; rdx = 0, argv
        pop rsi                         ; rsi = 0 
        push rsi                        ; null terminator (envp)

        mov rbx, 0x68732f2f6e69622f     ; /bin//sh
        push rbx

        mov rdi, rsp                    ; path
        syscall
        
; cdq = sign extended eax -> edx. check eflags or rflags before use   