.PHONY: all clean fclean re test run pr

all:
	nasm -f elf64 -F dwarf -g -w+all tests/main.s -o main.out -I ./inc
	nasm -f elf64 -F dwarf -g -w+all tests/tests.s -o batch_test.out -I ./inc
	nasm -f elf64 -F dwarf -g -w+all tests/auxiliary_func.s -o aux.out -I ./inc
	nasm -f elf64 -F dwarf -g -w+all srcs/ft_strlen.s -o build/ft_strlen.o
	ld -g main.out aux.out batch_test.out build/ft_strlen.o -o main
	./main

# assembler & linker
NASM		:= nasm
NASMFLAG	:= -f elf64 -F dwarf -g -w+all
LD			:= ld -g
LDFLAGS		:= #--nmagic -m elf_i386 -L$(VPATH) --script=os.lds
#VPATH=../src

# general variables
INC			:= inc
HEADER		:= $(INC)/header.s
SRC_DIR		:= srcs/
OBJ_DIR		:= build/
TEST_DIR	:= tests/
TESTER		:= tester
NAME		:= libasm.a

CORE		:= ft_strlen.s \
				ft_strcpy.s \
				ft_strcmp.s \
				ft_write.s \
				ft_read.s \
				ft_strdup.s

TEST_SRCS	:=	tests.s \
				main.s

SRCS		:= $(addprefix $(SRC_DIR), $(CORE))
OBJS		:= $(addprefix $(OBJ_DIR), $(CORE:.s=.o))
TEST_OBJ	:= $(addprefix $(TEST_DIR), $(TEST_SRCS:.s=.o))

#all: $(OBJ_DIR) $(NAME)

test: $(NAME) $(TEST_OBJ)
		$(LD) $(LDFLAGS) $(TEST_OBJ) $(NAME) -o $(TESTER)

$(NAME): $(OBJS)
		ar rcs $@ $^

$(OBJ_DIR)%.o: $(SRC_DIR)%.s -I ./inc
		$(NASM) $(NASMFLAGS) $< -o $@ -I ./inc

$(OBJ_DIR):
		mkdir -p $(OBJ_DIR)

run:
		./$(TESTER)

clean:
		rm -rf $(OBJ_DIR) $(TEST_OBJ)

fclean: clean
		rm -f $(NAME)

re: fclean all
		@echo "== Project rebuilt. =="

bonus:
		@echo "WIP"
