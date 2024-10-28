.PHONY: all clean fclean re test run

# assembler & linker
NASM		:= nasm
NASMFLAGS	:= -f elf64 -F dwarf -g -w+all
LD			:= ld
LDFLAGS		:= -g

# general variables
INC			:= inc/
SRC_DIR		:= srcs/
OBJ_DIR		:= build/
TESTER		:= tester
NAME		:= libasm.a
SRCS		:=	ft_strlen.s \
				ft_strcpy.s \
				ft_strcmp.s \
				ft_write.s \
				ft_read.s \
				ft_strdup.s
TEST_SRCS	:=	auxiliary_func.s \
				tests.s \
				main.s

OBJS		:= $(addprefix $(OBJ_DIR),$(notdir $(SRCS:.s=.o)))
TEST_OBJ	:= $(addprefix $(OBJ_DIR),$(notdir $(TEST_SRCS:.s=.o)))

all: $(OBJ_DIR) $(NAME)

$(NAME): $(OBJS)
		ar rcs $@ $^

test: all $(TEST_OBJ)
		$(LD) $(LDFLAGS) $(TEST_OBJ) $(NAME) -o $(TESTER) -I ./inc

$(OBJ_DIR)%.o: $(SRC_DIR)%.s
		$(NASM) $(NASMFLAGS) $< -o $@ -I ./inc

$(OBJ_DIR):
		mkdir -p $(OBJ_DIR)

run:
		./$(TESTER)

clean:
		rm -rf $(OBJ_DIR)

fclean: clean
		rm -f $(NAME) $(TESTER)

re: fclean all
		@echo "== Project rebuilt. =="

bonus:
		@echo "WIP"
