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
	mov dl, BYTE [rsi]
	mov BYTE [rdi], dl
	inc rdi
	inc rsi
	cmp BYTE [rsi], 0
	jnz .till_zero
	mov BYTE [rdi], 0
.finish:
	mov rsp, rbp
	pop rbp
	ret
