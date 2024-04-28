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
	sub rsp, 224
	mov esi, 1
	mov [rbp-72], esi
	mov esi, 0
	mov [rbp-24], esi
	mov edi, [rbp-24]
	mov eax, [rbp-72]
	cmp eax, edi
	mov [rbp-72], eax
	jz lab1267
	jmp lab1273
lab1267:	mov esi, 1
	mov [rbp-64], esi
	mov esi, 2
	mov [rbp-56], esi
	mov esi, 3
	mov [rbp-16], esi
	mov esi, [rbp-56]
	mov [rbp-48], esi
	mov edi, [rbp-16]
	mov eax, [rbp-48]
	imul eax, edi
	mov [rbp-48], eax
	mov esi, [rbp-64]
	mov [rbp-40], esi
	mov edi, [rbp-48]
	mov eax, [rbp-40]
	add eax, edi
	mov [rbp-40], eax
	mov esi, [rbp-40]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
lab1273:	mov esi, 1
	mov [rbp-112], esi
	mov esi, 3
	mov [rbp-104], esi
	mov esi, 4
	mov [rbp-96], esi
	mov esi, [rbp-104]
	mov [rbp-32], esi
	mov edi, [rbp-96]
	mov eax, [rbp-32]
	add eax, edi
	mov [rbp-32], eax
	mov esi, [rbp-112]
	mov [rbp-88], esi
	mov edi, [rbp-32]
	mov eax, [rbp-88]
	sub eax, edi
	mov [rbp-88], eax
	mov esi, [rbp-88]
	lea rdi, [rel int_format]
	mov eax, 0
	call _printf
	mov rax, 0
	jmp finish_up
finish_up:	add rsp, 224
	leave 
	ret 

