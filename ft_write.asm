extern ___error
global _ft_write

section .text
    _ft_write:
        push rbp
        mov rbp, rsp
        mov     rax, 0x2000004	; write syscall number
        syscall
        jc set_errno
        jmp done
    set_errno:
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

; Compilation help
;nasm -fmacho64 ft_write.asm -o ft_write.o && ld -macosx_version_min 10.14 -no_pie -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem ft_write.o -o ft_write && ./ft_write