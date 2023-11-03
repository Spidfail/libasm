; extern ___error
extern __errno_location
global ft_read

section .text
    ft_read:           ; rdi = fd, rsi = buf, rdx = count
        push rbp
        mov rbp, rsp
        mov rax, 0x2000003  ; syscall to read on macOs
        syscall
        jc set_errno
        jmp done
    set_errno:  ; errno = rdi, return_value = rsi
        push rax
        push rdx        ; Useless code, make stack alligned
        call __errno_location
        pop rdx
        pop rcx
        mov [rax], rcx  ; Set the errno in the int ptr
        mov rax, -1     ; Set the return value to -1
    done:
        pop rbp
        ret