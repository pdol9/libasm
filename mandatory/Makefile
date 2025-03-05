.PHONY: all clean fclean re test ctest debug val

# assembler & linker
NASM		:= nasm
NASMFLAGS	:= -f elf64 -F dwarf -g -w+all
LD			:= ld
DEBUG		:= -g

# general variables
TEST_FILE	:= test-file-ft_write.txt
INC			:= inc/
SRC_DIR		:= srcs/
OBJ_DIR		:= build/
TESTER		:= tester
CTESTER		:= c_tester
NAME		:= libasm.a
SRCS		:=	ft_strlen.s \
				ft_strcpy.s \
				ft_strcmp.s \
				ft_write.s \
				ft_read.s \
				ft_strdup.s
TEST_SRCS	:=	auxiliary_func.s \
				test-ft_read.s \
				test-ft_strcmp.s \
				test-ft_strcpy.s \
				test-ft_strdup.s \
				test-ft_strlen.s \
				test-ft_write.s \
				main.s
CTEST_SRC	:=	./srcs/main.c

OBJS		:= $(addprefix $(OBJ_DIR),$(notdir $(SRCS:.s=.o)))
TEST_OBJ	:= $(addprefix $(OBJ_DIR),$(notdir $(TEST_SRCS:.s=.o)))

all: $(OBJ_DIR) $(NAME)

$(NAME): $(OBJS)
	ar rcs $@ $^

ctest: $(CTESTER)
	./$(CTESTER)

$(CTESTER): $(OBJ_DIR) $(NAME) $(CTEST_SRC)
	$(CC) $(DEBUG) $(CTEST_SRC) -I ./ -L. -lasm $(NAME) -o $(CTESTER) -Wpedantic -Werror -Wall -Wextra

test: $(OBJ_DIR) $(TEST_OBJ) $(NAME)
	$(LD) $(DEBUG) -I ./inc $(TEST_OBJ) $(NAME) -o $(TESTER) -lc --dynamic-linker /lib64/ld-linux-x86-64.so.2
	./$(TESTER)

$(OBJ_DIR)%.o: $(SRC_DIR)%.s
	$(NASM) $(NASMFLAGS) $< -o $@ -I ./inc

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

clean:
	rm -rf $(OBJ_DIR) ||:

fclean: clean
	rm -f $(NAME)
	rm -f $(TESTER) ||:
	rm -f $(CTESTER) ||:
	rm -f $(TEST_FILE) ||:

val: $(CTESTER)
	@printf "\n$$ "
	valgrind --leak-check=full --show-leak-kinds=all ./$(CTESTER)

debug:
	strace ./$(CTESTER)
#	strace ./$(TESTER)

re: fclean all
	@echo "==== Project rebuilt. ===="

bonus:
	@echo "WIP"
