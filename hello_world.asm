
;nasm -fmacho64 hello_world.s -o hello_world.o && ld -macosx_version_min 10.14 -no_pie -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem hello_world.o -o hello_world && ./hello_world

; With debugging symboles :
;nasm -gdwarf

;;;; Notes
; Syscall are not the precise number, but an 'hexa' value : 0x2000004
; and it's the case for all the syscall.



;;; HELLO WORLD !!!!!!

global _main       ;must be declared for using gcc

section .text

putstr:
	mov rdx, rdi			;len
	; already given by the 'call' -> mov rsi, msg
	mov rdi, 1				;fd
	mov rax, 0x2000004	;write syscall number
	syscall
	ret

_main: ;tell linker entry point
	mov rdi, len			;len as first argument
	mov rsi, msg			;msg as second argument
	call putstr

	mov rax, 0x2000001
	mov rdi, 0
	syscall

section	.data
	 msg:     db  'Hello world!', 10
	 len:     equ  14
