##
## EPITECH PROJECT, 2026
## Makefile
## File description:
## test Makefile
##

CC	= 	 clang

CFLAGS 	=	-Iinclude/

LDFLAGS  = 	-Llib/my

LDLIBS   = 	-lmy

SRC 	=	src/organized.c

OBJ_DIR	=	obj

OBJ	 = 	$(SRC:src/%.c=$(OBJ_DIR)/%.o)

NAME	 = 	organized

all: 	$(NAME)

$(NAME):	$(OBJ)
	make -C lib/my/
	$(CC) -o $(NAME) $(OBJ) $(LDFLAGS) $(LDLIBS)

$(OBJ_DIR)/%.o: src/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

.NOTPARALLEL: debug
debug: CFLAGS += -g
debug: fclean $(OBJ)
	make -C lib/my/
	$(CC) -o $(NAME) $(OBJ) $(LDFLAGS) $(LDLIBS) $(GFLAGS)

.NOTPARALLEL: codingstyle
codingstyle: CC = epiclang
codingstyle: CFLAGS += -Wall -Wextra -Werror
codingstyle: fclean $(OBJ)
	make -C lib/my/
	$(CC) -o $(NAME) $(OBJ) $(LDFLAGS) $(LDLIBS) $(GFLAGS)

.NOTPARALLEL: fanalyzer
fanalyzer: CC = gcc -fanalyzer
fanalyzer: fclean $(OBJ)
	make -C lib/my/
	$(CC) -o $(NAME) $(OBJ) $(LDFLAGS) $(LDLIBS) $(GFLAGS)

clean:
	rm -rf $(OBJ_DIR)
	make clean -C lib/my/

fclean: clean
	rm -rf $(NAME)
	rm -rf ./$(NAME)
	make fclean -C lib/my

.NOTPARALLEL: re
re: 	fclean all

.PHONY: all debug codingstyle clean fclean re
