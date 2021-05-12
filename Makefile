##
## EPITECH PROJECT, 2021
## B-ASM-400-TLS-4-1-asmminilibc-justine.fricou
## File description:
## Makefile
##

NAME	=	libasm.so

SRC	=	source/strlen.asm \
		source/strchr.asm \
		source/memset.asm \
		source/memcpy.asm \
		source/strcmp.asm \
		source/strncmp.asm \
		source/strcasecmp.asm \
		source/rindex.asm \

OBJ	=	$(SRC:.asm=.o)

all:	$(NAME)

$(NAME):	$(OBJ)
			ld -fPIC -shared $(OBJ) -o $(NAME)

%.o : %.asm
		nasm -f elf64 $< -o $@

clean:
		rm -f $(OBJ)
		rm -f tests main.o

fclean:	clean
		rm -f $(NAME)

re:	fclean all
