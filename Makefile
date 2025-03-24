.PHONY: all clean fclean re test ctest debug val bonus

# assembler & linker
NASM		:= nasm
NASMFLAGS	:= -f elf64 -F dwarf -g -w+all
LD			:= ld
DEBUG		:= -g

# general variables
DIR				:= mandatory
INC				:= $(DIR)/inc/
SRC_DIR			:= $(DIR)/srcs/
OBJ_DIR			:= $(DIR)/build/
TESTER			:= $(DIR)/tester
CTESTER			:= $(DIR)/c_tester
NAME			:= $(DIR)/libasm.a
TEST_FILE		:= $(DIR)/test-file-ft_write.txt
SRCS			:=	ft_strlen.s \
					ft_strcpy.s \
					ft_strcmp.s \
					ft_write.s \
					ft_read.s \
					ft_strdup.s
TEST_SRCS		:=	auxiliary_func.s \
					test-ft_read.s \
					test-ft_strcmp.s \
					test-ft_strcpy.s \
					test-ft_strdup.s \
					test-ft_strlen.s \
					test-ft_write.s \
					main.s
CTEST_SRC		:=	$(DIR)/srcs/main.c

OBJS		:= $(addprefix $(OBJ_DIR),$(notdir $(DIR)/$(SRCS:.s=.o)))
TEST_OBJ	:= $(addprefix $(OBJ_DIR),$(notdir $(DIR)/$(TEST_SRCS:.s=.o)))

all: $(OBJ_DIR) $(NAME)

$(NAME): $(OBJS)
	ar rcs $@ $^

ctest: $(CTESTER)
	./$(CTESTER)

$(CTESTER): $(OBJ_DIR) $(NAME) $(CTEST_SRC)
	$(CC) $(DEBUG) $(CTEST_SRC) -I ./ -Lmandatory -lasm $(NAME) -o $(CTESTER) -Wpedantic -Werror -Wall -Wextra

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


#########		BONUS		##########

# variables
BONUS			:= bonus
INC_BONUS		:= $(BONUS)/inc
BONUS_SRC_DIR	:= $(BONUS)/srcs

bonus: all
	cc $(BONUS_SRC_DIR)/main_bonus.c $(BONUS_SRC_DIR)/ft_list_size.c $(BONUS_SRC_DIR)/ft_list_push_front.c -I $(INC_BONUS) -o $(BONUS_SRC_DIR)/tester
	./$(BONUS_SRC_DIR)/tester
