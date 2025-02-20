;;
;;	int strcmp(const char *s1, const char *s2);
;;

GLOBAL ft_strcmp

SECTION .text

ft_strcmp:
	push rbp
	mov rbp, rsp
	xor rax, rax
.eq:
	mov al, BYTE [rdi]
	mov cl, BYTE [rdi]
	sub al, BYTE [rsi]
	jnz .finish
	and cl, BYTE [rsi]
	jz .finish
	inc rdi
	inc rsi
	jmp .eq
.finish
	movsx rax, al
	mov rsp, rbp
	pop rbp
	ret
