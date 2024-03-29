
extern malloc
extern ft_strlen
extern ft_strcpy
; extern ___error
extern __errno_location

default rel

section .text
global ft_strdup

ft_strdup: ; src = rdi
    push rbp
    mov rbp, rsp
    cmp rdi, 0          ; Protection -> If the source ptr is NULL
    je done
    push rdx            ; Useless push : stack aligned
    push rdi            ; Save src ptr
    call ft_strlen
    pop rdi
    pop rdx
    inc rax             ; Add 1 for the trailing '\0'
alloc:
    push rax        ; Save the length
    push rdi        ; Save src ptr
    mov rdi, rax
    call malloc
    lea rdi, [rax]    ; Save the new allocated ptr in rsi
    pop rsi         ; Recover the source ptr. Now : rsi = src and rdi = dest
    pop rax
    cmp rax, 0      ; Check if malloc failed
    je done
    push rdi
    push rsi
    call ft_strcpy ; Result is already in rax
    pop rsi
    pop rdi
done:
    pop rbp
    ret
