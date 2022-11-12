
extern _malloc
extern _ft_strlen

section .data
global _ft_strdup

_ft_strdup:
    push rbp
    mov rbp, rsp
    cmp rdi, 0
    je done
    cmp BYTE[rax], 0
    je add_one
    call _ft_strlen


add_one:
    mov rax, 1

alloc:
    push rax        ; Save the length
    push rdi        ; Save src ptr
    mov rdi, rax
    call _malloc
    mov rsi, rax    ; Save the new allocated ptr in rsi
    pop rdi         ; Recover the source ptr
    pop rax
                    ; Now : rsi = dest and rdi = src
copy:
    mov rax, [rdi]
    mov [rsi], rax
    inc rdi
    inc rsi
    cmp BYTE[rdi], 0
    je done
done:
    pop rbp
    ret


