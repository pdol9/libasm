;;
;;	size_t strlen(const char *s);
;;

GLOBAL ft_strlen

SECTION .text

ft_strlen:
	lea rax, [rdi]			;; load memory addr
.check_null:
	cmp BYTE [rax], 0
	jz .found_null
	inc rax
	jmp .check_null
.found_null:
	sub rax, rdi
	ret
