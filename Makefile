NAME := tester
AR_FILE := libasm.a

NA := nasm
CC := gcc
AR := ar rcs

CFLAGS := -L. -lasm -Wall -Wextra -Werror -no-pie -fsanitize=address
NAFLAGS := -felf64
DEBFLAGS := -F dwarf -g

INC := libasm.h
CSRCS := main.c
SRCS := ft_strlen.asm \
		ft_write.asm \
		ft_strcpy.asm \
		ft_strdup.asm \
		ft_read.asm
OBJS := $(SRCS:.asm=.o)

################################################################

.PHONY : all clean fclean re

################################################################

all: $(NAME)

$(NAME): $(AR_FILE)
	$(CC) $(CFLAGS) $(CSRCS) $^ -o $@
	
$(AR_FILE): $(OBJS)
	$(AR) $@ $^

%.o :	%.asm $(INC) $(CSRCS)
	$(NA) $(NAFLAGS) $(DEBFLAGS) $< -o $@

################################################################

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(AR_FILE) $(NAME)

re: fclean all