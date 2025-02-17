;;
;;	char *strdup(const char *s);
;;

GLOBAL ft_strdup

EXTERN malloc

SECTION .text

ft_strdup:
	push rbp
	mov rbp, rsp
	push rbx
	push r12
	xor rcx, rcx
	lea rbx, [rdi]
.get_len:
	cmp BYTE [rdi], 0
	jz .alloc
	inc rdi
	inc rcx
	jmp .get_len
.alloc:
	inc rcx
	mov r12, rcx
	mov rdi, rcx
	call malloc
	mov rcx, r12
	test rax, rax
	jz .finish
.copy:
	mov r9b, BYTE [rbx]
	mov BYTE [rax], r9b
	inc rbx
	inc rax
	dec rcx
	cmp rcx, 0
	jg .copy
.finish:
	mov BYTE [rax - 1], 0
	sub rax, r12
	pop r12
	pop rbx
	mov rsp, rbp
	pop rbp
	ret
