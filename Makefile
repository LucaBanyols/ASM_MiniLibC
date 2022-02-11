##
## EPITECH PROJECT, 2021
## Makefile
## File description:
## Makefile
##

SRC		=	./src/strlen.asm	\
			./src/strchr.asm	\
			./src/memset.asm	\
			./src/memcpy.asm	\
			./src/strcmp.asm	\
			./src/memmove.asm	\
			./src/strncmp.asm	\
			./src/strcasecmp.asm	\
			./src/rindex.asm	\
			./src/strstr.asm	\
			./src/strpbrk.asm	\
			./src/strcspn.asm

OBJ		=	$(SRC:.asm=.o)

NASM		=	nasm

SFLAGS		=	-f elf64 -Werror

LD		=	ld

LDFLAGS		=	-shared

RM		=	rm -f

NAME		=	libasm.so

all:	$(NAME)

$(NAME):	$(OBJ)
	$(LD) -o $(NAME) $(OBJ) $(LDFLAGS)

%.o:	%.asm
	$(NASM) $(SFLAGS) $< -o $@

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) ./a.out
	$(RM) $(NAME)
	$(RM) *~

re:	fclean all

.PHONY: all clean fclean re
