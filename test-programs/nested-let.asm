section .data
	int_format db "%ld",10,0


	global _main
	extern _printf
section .text


_start:	call _main
	mov rax, 60
	xor rdi, rdi
	syscall


_main:	push rbp
	mov rbp, rsp
	sub rsp, 48
	mov esi, [rbp-16]
	mov [rbp-8], esi
	mov rax, [rbp-24]
	jmp finish_up
finish_up:	add rsp, 48
	leave 
	ret 

