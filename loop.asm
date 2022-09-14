extern _printf

global _main

section .data
	str_format	db "%d", 10, 0

section .text

	_main:
		push rbp
		mov rcx, 10

	L1:

		; call save
		push rax
		push rcx

		; prepare printf
		mov rdi, str_format	; 1st parameter -> format
		mov rsi, rcx		; 2nd parameter -> number
		mov rax, 0
		call _printf

		; restore call saver
		pop rcx
		pop rax

		dec rcx
		jnz L1

		pop rbp
		mov rax, 0
		ret

;nasm -fmacho64 loop.asm -o loop.o && ld -macosx_version_min 10.14 -no_pie -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem loop.o -o loop && ./loop
