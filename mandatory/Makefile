.PHONY: all clean fclean re

NASM=nasm
NASMFLAGS= -f elf64 -F dwarf -g -w+all
LD=ld -g
LDFLAGS= #--nmagic -m elf_i386 -L$(VPATH) --script=os.lds
#VPATH=../src

OBJS= ft_strlen.o \
			ft_strcpy.o \
			ft_strcmp.o \
			ft_write.o \
			ft_read.o \
			ft_strdup.o \
			tests.o \
			main.o

SRCS = ft_strlen.s \
			ft_strcpy.s \
			ft_strcmp.s \
			ft_write.s \
			ft_read.s \
			ft_strdup.s \
			tests.s \
			main.s

NAME=libasm.a

all: $(NAME)

$(NAME) : $(OBJS)
		$(LD) $(LDFLAGS) $^ -o $@

%.o : %.s
		$(NASM) $(NASMFLAGS) $< -o $@

clean:
		rm -rf $(OBJS)

fclean: clean
		rm -f $(NAME)

re: fclean all
		echo "project rebuild"

bonus:
		echo "WIP"
