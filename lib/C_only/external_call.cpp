#include<iostream>
#include "hashTable.h"

    hashTable* hashTable_new(){
		hashTable* tmp=new hashTable();
		std::cout<<tmp<<std::endl;
        return tmp;
    }
    void hashTable_delete(hashTable* const itself){
		std::cout<<itself<<std::endl;
        delete itself;
    }

    void hashTable_clear(hashTable* itself){
        std::cout<<itself<<"\n";
        if (itself==NULL){
            std::cout<<"null pointer!\n";
        }
        itself->clear();
    }

    void hashTable_insert(hashTable* itself,int key,char* value){
        itself->insert(key,value);
    }

    void  hashTable_find(hashTable* itself,int&key,char* & output, int& ierr){
        output=itself->find(key,ierr);
    }
