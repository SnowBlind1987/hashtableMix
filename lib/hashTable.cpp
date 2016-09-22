#include<iostream>
#include "hashTable.h"
//#include <unordered_map>

using namespace std;

void hashTable::insert(int key, char* val){
    this->myHash.insert(make_pair(key,val));
}

void hashTable::clear(){
    std::cout<<"actually made it to C\n";
	auto it=this->myHash.begin();
    std::cout<<"past iter\n";

	for(it;it!=myHash.end();it++ ){
		this->myHash.erase(it);
	}
}

char* hashTable::find(int key, int & ierr){
	auto it=this->myHash.find(key);
	if (it==this->myHash.end()){
		ierr=-1;
        char * empty="";
        return empty;
	}
    else{
        ierr=0;
        return it->second;
	}	
}

extern "C"{
    hashTable* hashTable__new(){
        return new hashTable();
    }
    void hashTable__delete(hashTable* itself){
        delete itself;
    }

    void hashTable__clear(hashTable* itself){
        itself->clear();
    }

    void hashTable__insert(hashTable* itself,int key,char* value){
        itself->insert(key,value);
    }

    void  hashTable__find(hashTable* itself,int&key,char* & output, int& ierr){
        output=itself->find(key,ierr);
    }
}
