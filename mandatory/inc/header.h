;
; CONSTANTS
;

; System Call Numbers
SYS_READ		equ 0
SYS_WRITE		equ 1
SYS_OPEN		equ 2
SYS_CLOSE		equ 3
SYS_EXIT		equ 60

;; File Descriptors
STDOUT			equ 1
STDIN			equ 0
STDERR			equ 2

;; Return Codes
SUCCESS			equ 0
ERROR			equ -1

;; Function prototypes
%define println println
%define print print
%define print_int print_int

%define ft_strlen ft_strlen
%define ft_strcpy ft_strcpy
%define ft_strcmp ft_strcmp
%define ft_write ft_write
%define ft_read ft_read
%define ft_strdup ft_strdup

%define run_strlen_batch run_strlen_batch
