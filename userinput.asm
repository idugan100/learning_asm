section .data
	text db "What is your name? "
	greeting db "Hello "

section .bss
	name resb 16
	

section .text
	global _start
_start:
	call _promptInput
	call _getInput
	call _sayHello
	call _exit

_promptInput:
	mov rax, 1
	mov rdi, 1
	mov rsi, text
	mov rdx, 19
	syscall
	ret

_getInput:
	mov  rax, 0
	mov rdi, 0
	mov rsi, name
	mov rdx, 16
	syscall
	ret

_sayHello:
	mov rax, 1
	mov rdi, 1
	mov rsi, greeting
	mov rdx, 6
	syscall

	mov rax, 1
	mov rdi, 1
	mov rsi, name
	mov rdx, 16
	syscall
	ret
 
_exit:
	mov rax, 60
	mov rdi, 0
	syscall
	ret
