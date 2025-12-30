section .text
global _start

_start:
    jmp short data_call

code_start:
    pop rsi              ; RSI = data start

read_loop:
	lodsb                ; AL = [RSI], RSI++
    test al, al
    je done

    ; write(1, RSI-1, 1)
	push 1
	pop rax
    movzx edi, al
    lea rsi, [rsi-1]
    movzx edx, al
    syscall

    inc rsi              ; restore pointer
    jmp read_loop

done:
    jmp $

data_call:
    call code_start
    db "PIC DATA", 0
