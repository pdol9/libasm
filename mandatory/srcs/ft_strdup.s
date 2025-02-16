;;
;;	char *strdup(const char *s);
;;

GLOBAL ft_strdup

EXTERN malloc

SECTION .text

ft_strdup:
	push rbp
	push rbx
	push r12
	mov rbp, rsp
	xor rcx, rcx
	lea rbx, [rdi]
.get_len:
	cmp BYTE [rdi], 0
	jz .alloc
	inc rdi
	inc rcx
	jmp .get_len
.alloc:
	mov r12, rcx
	mov rdi, rcx
	call malloc
	mov rcx, r12
	cmp rax, 0
	jz .finish
.copy:
	mov BYTE r9b, BYTE [rbx]
	mov BYTE [rdi], r9b
	inc rbx
	inc rdi
	dec rcx
	cmp rcx, 0
	jg .copy
.finish:
	mov BYTE [rdi], 0
	mov rsp, rbp
	pop r12
	pop rbx
	pop rbp
	ret
