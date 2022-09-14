section .text
    ft_write:
        ; save the stack
        push    rbp
        mov     rbp, rsp

        mov     rax, 0x2000004	;ft_write syscall number
        syscall

        ; restaure the stack
        pop     rbp
        ret

; Compilation help
;nasm -fmacho64 ft_write.asm -o ft_write.o && ld -macosx_version_min 10.14 -no_pie -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem ft_write.o -o ft_write && ./ft_write
    