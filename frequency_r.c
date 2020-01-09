#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include"trieTree.h"

#define WORD 30
#define BUFFER 1024

char input[BUFFER];

void frequency(Node* head, char* str, int level){
	
	if(head == NULL){
		return;
	}

	if(head->endWord){
		str[level] = '\0';
		printf("%s\t",str);
		printf("%d\n", head->count);		
	}

	for(int i = NUMOFLETTERS-1; i >= 0 ; i--){
		if(head->children[i]){
			*(str+level) = i + 'a';
			frequency(head->children[i],str,level+1);
		}
	}
	
}


void trieFree(Node* root){

    if(root != NULL){

        int i;
        for(i = 0; i < NUMOFLETTERS; i++){

            if(root->children[i] != NULL){
                trieFree(root->children[i]);
            }
        }
        free(root);
    }
}


int main(int argc, char* argv[]){
	Node *head = newNode();
	for(int i = 1; i < argc; i++){
		insert(head, argv[i]);
	}
	char str[BUFFER]={'\0'};
	int level = 0;
	frequency(head,str,level);
	trieFree(head);
	return 0 ;
}
