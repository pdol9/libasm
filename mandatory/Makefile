.PHONY: all clean fclean re test run

# assembler & linker
NASM		:= nasm
NASMFLAGS	:= -f elf64 -F dwarf -g -w+all
LD			:= ld
LDFLAGS		:= -g

# general variables
TEST_FILE	:= ./srcs/test.txt
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

OBJS		:= $(addprefix $(OBJ_DIR),$(notdir $(SRCS:.s=.o)))
TEST_OBJ	:= $(addprefix $(OBJ_DIR),$(notdir $(TEST_SRCS:.s=.o)))

all: $(OBJ_DIR) $(NAME)

$(NAME): $(OBJS)
	ar rcs $@ $^

ctest:
	$(CC) $(LDFLAGS) ./srcs/main.c -I ./ $(NAME) -o $(CTESTER)
	./$(CTESTER)

test: $(OBJ_DIR) $(TEST_OBJ) $(NAME)
	$(LD) $(LDFLAGS) -I ./inc $(TEST_OBJ) $(NAME) -o $(TESTER) -lc --dynamic-linker /lib64/ld-linux-x86-64.so.2
	./$(TESTER)

$(OBJ_DIR)%.o: $(SRC_DIR)%.s
	$(NASM) $(NASMFLAGS) $< -o $@ -I ./inc

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

run:
	./$(TESTER)

clean:
	rm -rf $(OBJ_DIR)
	rm -f $(TEST_FILE)

fclean: clean
	rm -f $(NAME) $(TESTER)

clear_test:
	rm -f $(TESTER)
	rm -f $(TEST_FILE)

debug:
	strace ./$(TESTER)

re: fclean all
	@echo "== Project rebuilt. =="

bonus:
	@echo "WIP"
