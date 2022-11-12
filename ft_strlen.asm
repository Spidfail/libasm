
section .text
global _ft_strlen
    _ft_strlen:          ;rdi -> const char *
        push rbp
        mov rbp, rsp
        lea rax, BYTE[rdi]      ;counter initialisation    
    L1:
        cmp BYTE[rdi], 0
        je rtn
        add rdi, 1
        jmp L1
    rtn:
        ; Call exit
        sub rdi, rax        ; store the value to be returned
        mov rax, rdi
        pop rbp
        ret