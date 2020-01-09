#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include"trieTree.h"
#define BUFFER 256


Node* newNode(){
	Node *node = (Node*)malloc(sizeof(Node));
	if(node){
		node->letter='\0';
		node->count=0;
		node->endWord = FALSE;

		for(int i = 0; i < NUMOFLETTERS; i++){
			node->children[i] = NULL;
		}	
	}
	return node;
}

char downCase(char c){
	if(c>='A' && c<='Z'){
		return c-'A'+'a';
	}

	return c;
}


void insert(Node *root, char* str){
	Node *curr = root;	
	while(*str){
		char c = downCase(*str);
		if(curr->children[c-'a']==NULL){
			curr->children[c-'a'] = newNode();
		}
		curr->letter=*str;
		curr = curr->children[c-'a'];
		str = str+1;
		curr->count++;
	}
	
	curr->endWord=TRUE;		
}




int haveChildren(Node* curr){
	for(int i = 0; i < NUMOFLETTERS; i++){
		if(curr->children[i]!=NULL){
			return TRUE;
		}
	}
	return FALSE;
}


int search(Node *root,char *str){
	if(root==NULL){
		return 0;
	}

	Node *curr = root;

	while(*str){
		curr = curr->children[*str-'a'];

		if(curr == NULL){
			return 0;
		}
		str++;
	}

	return curr->count;
}




















