;;
;;	size_t strlen(const char *s);
;;

global ft_strlen

section .text

ft_strlen:
	push rbp
	mov rbp, rsp
	mov rax, rdi
.check_null:
	cmp BYTE [rax], 0
	jz .found_null
	inc rax
	jmp .check_null
.found_null:
	sub rax, rdi
	pop rbp
	ret

;2. variation
;
;ft_strlen:
;	or eax, -1
;.check_null:
;	inc eax
;	cmp byte [rdi + rax], 0
;	jnz .check_null
;	retn

; 3. variation
;
;my_strlen:
;	or ecx, -1
;	mov al, 0
;	repnz scasb
;	not ecx
;	dec ecx
;	xchg eax, ecx
;	retn
