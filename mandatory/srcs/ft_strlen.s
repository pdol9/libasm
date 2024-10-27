;;
;;  size_t strlen(const char *s);
;;

global my_strlen

section .text

my_strlen:
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