;;
;;	size_t strlen(const char *s);
;;

global ft_strlen

section .text

ft_strlen:
	push rbp
	mov rbp, rsp
	lea rax, [rdi]			;; load memory addr
.check_null:
	cmp BYTE [rax], 0
	jz .found_null
	inc rax
	jmp .check_null
.found_null:
	sub rax, rdi
	mov rsp, rbp
	pop rbp
	ret