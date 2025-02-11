;;
;;	char *strcpy(char *dest, const char *src);
;;

GLOBAL ft_strcpy

SECTION .text

ft_strcpy:
	push rbp
	mov rbp, rsp
	lea rax, [rdi]

.till_zero:
	cmp BYTE [rsi], 0
	jz .finish
	movsb
	jmp .till_zero
.finish:
	mov BYTE [rdi], 0
	mov rsp, rbp
	pop rbp
	ret
