;; System Call Numbers
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
%define put_string put_string
%define print_string print_string
%define print_int print_int

%define ft_strlen ft_strlen
%define ft_strcpy ft_strcpy
%define ft_strcmp ft_strcmp
%define ft_write ft_write
%define ft_read ft_read
%define ft_strdup ft_strdup

%define ft_strlen_tests.s ft_strlen_tests.s
%define ft_strcmp_tests.s ft_strcmp_tests.s
%define ft_strcpy_tests.s ft_strcpy_tests.s
%define ft_write_tests.s  ft_write_tests.s
%define ft_read_tests.s   ft_read_tests.s
%define ft_strdup_tests.s ft_strdup_tests.s
