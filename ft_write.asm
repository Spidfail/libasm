global _ft_write

section .text
    _ft_write:
        ; Do not need to save the stack
        mov     rax, 0x2000004	; write syscall number
        syscall
        ret

; Compilation help
;nasm -fmacho64 ft_write.asm -o ft_write.o && ld -macosx_version_min 10.14 -no_pie -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem ft_write.o -o ft_write && ./ft_write