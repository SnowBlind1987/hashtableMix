#include<iostream>
#include "hashTable.h"
#include "external_call.h"
//#include <unordered_map>

using namespace std;

hashTable::hashTable(){
    std::cout<<"Calling constructor\n";
}

hashTable::~hashTable(){
    std::cout<<"Calling destructor\n";
}
void hashTable::insert(int key, char* val){
    this->myHash_.insert(make_pair(key,val));
}

void hashTable::clear(){
    //std::cout<<"actually made it to C\n";
	auto it=this->myHash_.begin();
    //std::cout<<"past iter\n";

	for(it;it!=myHash_.end();it++ ){
		this->myHash_.erase(it);
	}
}

char* hashTable::find(int key, int & ierr){
	auto it=this->myHash_.find(key);
	if (it==this->myHash_.end()){
		ierr=-1;
        char * empty='\0';
        
	}
    else{
        ierr=0;
        return it->second;
	}	
}

extern "C"{
    hashTable* hashTable__new_(){
		hashTable* tmp=new hashTable();
		std::cout<<tmp<<std::endl;
        return tmp;
    }
    void hashTable__delete_(hashTable* const itself){
		std::cout<<itself<<std::endl;
        delete itself;
    }

    void hashTable__clear_(hashTable* itself){
        std::cout<<itself<<"\n";
        if (itself==NULL){
            std::cout<<"null pointer!\n";
        }
        itself->clear();
    }

    void hashTable__insert_(hashTable* itself,int key,char* value){
        itself->insert(key,value);
    }

    void  hashTable__find_(hashTable* itself,int&key,char* & output, int& ierr){
        output=itself->find(key,ierr);
    }
}
