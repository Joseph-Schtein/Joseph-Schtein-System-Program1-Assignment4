CC=gcc
AR=ar
OBJECT_TRIE_TREE=trieTree.o 
OBJECT_FREQUENCY=frequency.o
OBJECT_FREQUENCY_REVERSE=frequency_r.o
FLAGS = -Wall -g

all: main

main: frequencymain frequency_rmain

frequencymain:  $(OBJECT_FREQUENCY) frequency
	     $(CC) $(FLAGS) -o frequency $(OBJECT_TRIE_TREE) libfrequency.a 

frequency_rmain: $(OBJECT_FREQUENCY_REVERSE) frequency_r
	     $(CC) $(FLAGS) -o frequency_r $(OBJECT_TRIE_TREE) libfrequency_r.a 


frequency: libfrequency.a
libfrequency.a: $(OBJECT_TRIE_TREE) $(OBJECT_FREQUENCY)
	 $(AR) -rcs libfrequency.a $(OBJECT_FREQUENCY) $(OBJECT_TRIE_TREE)


frequency_r: libfrequency_r.a
libfrequency_r.a: $(OBJECT_TRIE_TREE) $(OBJECT_FREQUENCY_REVERSE)
	 $(AR) -rcs libfrequency_r.a $(OBJECT_FREQUENCY_REVERSE) $(OBJECT_TRIE_TREE)


frequency.o: frequency.c
	 $(CC) $(FLAGS) -c -fPIC frequency.c

frequency_r.o: frequency_r.c
	 $(CC) $(FLAGS) -c -fPIC frequency_r.c

trieTree.o: trieTree.c
	 $(CC) $(FLAGS) -c -fPIC trieTree.c

.PHONY: 
	all clean frequency_r main frequency
clean: 
	 rm -rf *.o *.a main 
