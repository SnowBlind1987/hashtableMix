#include<iostream>
#include "hashTable.h"
//#include <unordered_map>

using namespace std;
hashTable::hashTable(){
    myHash=new unordered_map<int,char*>;
}

hashTable::~hashTable(){
    delete myHash;
}

void hashTable::insert(int key, char* val){
    this->myHash->insert(make_pair(key,val));
}

void hashTable::hashInit(){
    std::cout<<"actually made it to C\n";
	auto it=myHash->begin();
    std::cout<<"past iter\n";

	for(it;it!=myHash->end();it++ ){
		myHash->erase(it);
	}
}

void hashTable::find(int key,char* & output,int & ierr){
	auto it=myHash->find(key);
	if (it==myHash->end()){
		ierr=-1;
        return;
	}
    else{
		output =it->second;
        ierr=0;
        return;
	}	
}

extern "C"{
    hashTable* hashTable__new(){
        return new hashTable();
    }
    void hashTable__delete(hashTable* itself){
        delete itself;
    }

    void hashTable__init(hashTable* itself){
        itself->hashInit();
    }

    void hashTable__insert(hashTable* itself,int&key,char* value){
        itself->insert(key,value);
    }

    char* hashTable__find(hashTable* itself,int&key,char*& value, int& ierr){
        itself->find(key,value,ierr);
    }
}
