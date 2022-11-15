extern ___error
global _ft_read

section .text
    _ft_read:           ; rdi = fd, rsi = buf, rdx = count
        push rbp
        mov rbp, rsp
        mov rax, 0x2000003  ; syscall to read on macOs
        syscall
        jc set_errno
        jmp done
    set_errno:  ; errno = rdi, return_value = rsi
        push rax
        push rdx        ; Useless code, make stack alligned
        call ___error
        pop rdx
        pop rcx
        mov [rax], rcx  ; Set the errno in the int ptr
        mov rax, -1     ; Set the return value to -1
    done:
        pop rbp
        ret