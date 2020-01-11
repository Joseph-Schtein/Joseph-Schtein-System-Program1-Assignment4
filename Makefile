CC=gcc
AR=ar
OBJECT_FREQUENCY=frequency.o
OBJECT_FREQUENCY_REVERSE=frequency_r.o
FLAGS = -Wall -g

all: main

main: frequencymain frequency_rmain

frequencymain:  $(OBJECT_FREQUENCY) frequency
	     $(CC) $(FLAGS) -o frequency libfrequency.a 

frequency_rmain: $(OBJECT_FREQUENCY_REVERSE) frequency_r
	     $(CC) $(FLAGS) -o frequency_r  libfrequency_r.a 


frequency: libfrequency.a
libfrequency.a: $(OBJECT_FREQUENCY)
	 $(AR) -rcs libfrequency.a $(OBJECT_FREQUENCY) 


frequency_r: libfrequency_r.a
libfrequency_r.a: $(OBJECT_FREQUENCY_REVERSE)
	 $(AR) -rcs libfrequency_r.a $(OBJECT_FREQUENCY_REVERSE) 


frequency.o: frequency.c
	 $(CC) $(FLAGS) -c -fPIC frequency.c

frequency_r.o: frequency_r.c
	 $(CC) $(FLAGS) -c -fPIC frequency_r.c

.PHONY: 
	all clean frequency_r main frequency
clean: 
	 rm -rf *.o *.a main 
