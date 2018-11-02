#INCLUDE = -I/usr/X11R6/include/
#LIBDIR  = -L/usr/X11R6/lib

INCLUDE =
LIBDIR =

FLAGS = -Wall
CC = g++
CFLAGS = $(FLAGS) $(INCLUDE) -g
#LIBS = -lglut -lGL -lm -lGLU -lpthread
LIBS =

All: pre bin/test

clean:
	rm -fr bin

pre:
	mkdir -p bin

bin/%.o: %.cc
	$(CC) -c $(CFLAGS) -o $@ $<

bin/%.o: %.cc %.h
	$(CC) -c $(CFLAGS) -o $@ $<

objects = bin/test.o

bin/test: $(objects)
	$(CC) $(CFLAGS) -o $@ $(LIBDIR) $(objects) $(LIBS)
