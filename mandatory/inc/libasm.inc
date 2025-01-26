;; System Call Values
SYS_OPEN		equ 0x02
SYS_CLOSE		equ 0x03
SYS_EXIT		equ 0x3C

;; File Descriptors
STDIN			equ 0
STDOUT			equ 1
STDERR			equ 2

;; Function prototypes
%define error_handler error_handler
%define error_exit error_exit
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