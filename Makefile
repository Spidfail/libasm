NAME := tester
AR_FILE := libasm.a

NA := nasm
CC := gcc
AR := ar rcs

CFLAGS := -L. -lasm
NAFLAGS := -fmacho64
DEBFLAGS := -F dwarf -g

INC := libasm.h
CSRCS := main.c
SRCS := ft_strlen.asm \
		ft_write.asm \
		ft_strcpy.asm
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
	$(NA) $(NAFLAGS) $< -o $@

################################################################

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(AR_FILE) $(NAME)

re: fclean all