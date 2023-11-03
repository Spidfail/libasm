
section .text
global ft_strcpy
    ft_strcpy: ; rdi = dest, rsi = src
        push rbp
        mov rbp, rsp
        push rdi    ; save the pointer to return it
    L1:
        mov rax, [rsi]
        mov [rdi], rax
        inc rdi
        inc rsi
        cmp BYTE[rsi], 0
        je return
        jmp L1
    return:
        pop rax
        pop rbp
        ret         ; Return dest poped on rax
