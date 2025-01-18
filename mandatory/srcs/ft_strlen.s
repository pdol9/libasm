;;
;;	size_t strlen(const char *s);
;;

;; TODO -> set errno
;;		-> add tests 

global ft_strlen

section .text

ft_strlen:
	push rbp
	mov rbp, rsp
	lea rdx, [rdi]			;; load memory addr
.check_null:
	cmp BYTE [rdx], 0
	jz .found_null
	inc rdx
	jmp .check_null
.found_null:
	sub rdx, rdi
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