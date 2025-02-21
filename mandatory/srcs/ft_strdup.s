;;
;;	char *strdup(const char *s);
;;

GLOBAL ft_strdup

EXTERN __errno_location
EXTERN malloc

SECTION .text

ft_strdup:
	push rbx
	lea rbx, [rdi]
	xor rcx, rcx
.get_len:
	cmp BYTE [rdi], 0
	jz .alloc
	inc rdi
	inc rcx
	jmp .get_len
.alloc:
	inc rcx
	mov r8, rcx
	mov rdi, rcx
	call malloc
	test rax, rax
	jl .err
	mov rcx, r8
.copy:
	mov r9b, BYTE [rbx]
	mov BYTE [rax], r9b
	inc rbx
	inc rax
	dec rcx
	cmp rcx, 0
	jg .copy
	sub rax, r8
	jmp .exit
.err:
	neg rax
	mov r9, rax
	call __errno_location
	mov [rax], r9
	mov rax, -1
.exit:
	pop rbx
	ret
