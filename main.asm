extern _ft_strlen

default rel

global _main       ;must be declared for using gcc

section .data
	msg:     db  'Hello world!', 10 ; Add `\n` to the end

section .text
    exit:
        ; Call exit
        mov rax, 0x2000001  ; syscall number
        syscall

    _main:
        lea rdi, [msg]
        push rbp    
        mov rbp, rsp
        call _ft_strlen
        mov rdi, rax        ; store the value to be returned
        pop rbp             ; recover the pointer
        jmp exit