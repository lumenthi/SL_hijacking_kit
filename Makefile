.PHONY : all run test fclean re

NAME = hook
ARCHITECTURE = -m64 # -m32 -m64

COMPILER = gcc
COMPILER_FLAGS = $(ARCHITECTURE) -shared -fpic -ldl

TARGET = test_prog

SOURCE = $(NAME).c
LIBRARY = $(NAME).so

all: $(LIBRARY)

$(LIBRARY): $(SOURCE)
	$(COMPILER) $(SOURCE) $(COMPILER_FLAGS) -o $(LIBRARY)
	chmod -x $(LIBRARY)

# QUICK RULE TO COMPILE A TEST PROGRAM

test: test_prog

test_prog: test_prog.c
	gcc test_prog.c -o test_prog

#

fclean:
	rm $(LIBRARY)

re: fclean all

run: $(LIBRARY)
	@ export LD_PRELOAD=$(PWD)/$(LIBRARY) && ./$(TARGET)
