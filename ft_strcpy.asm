
section .text
global _ft_strcpy
    _ft_strcpy:
        ; rdi = dest, rsi = src
        push rbp
        mov rbp, rsp
        push rdi    ; save the pointer to return it
    L1:
        cmp BYTE[rsi], 0
        je return
        mov rax, [rsi]
        mov [rdi], rax
        inc rdi
        inc rsi
        jmp L1
    return:
        pop rax
        pop rbp
        ret
