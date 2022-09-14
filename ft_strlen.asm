
section .text

    ft_strlen:              ;rdi -> const char *
        push rbp            ;c stack protection
        mov rcx, 0          ;counter initialisation
        jmp L1
    Increment:
        inc rcx
    L1:
        cmp [rdi+rcx], 0    ;if the offset is == to 0
        jnz Increment
        
        ; Call exit
        mov rax, 0x2000001  ;syscall number
        mov rdi, rcx          ;return value
        pop rbp
        syscall