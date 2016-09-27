#include<iostream>
#include<string.h>
#include "hashTable.h"

using namespace std;

hashTable::hashTable(){
}

hashTable::~hashTable(){
}
int hashTable::Insert(int key, const char* val){
    bool inserted= this->myHash_.insert(make_pair(key,val)).second;
    
    if (inserted){
        return 0;
    }
    else {
        return -1;
    }
}

void hashTable::clear(){
	auto it=this->myHash_.begin();

	for(it;it!=myHash_.end();it++ ){
		this->myHash_.erase(it);
	}
}

void hashTable::showAll(){
	std::cout<<"My size is: "<<myHash_.size()<<std::endl;
	auto it=this->myHash_.begin();
	for (it;it!=myHash_.end();it++){
		std::cout<<it->first<<" "<<it->second<<std::endl;
	}
}

const char* hashTable::Find(int key, int & ierr){
	auto it=this->myHash_.find(key);
	if (it==this->myHash_.end()){
		ierr=-1;
        const char*   empty=" ";
        return empty; 
	}
    else{
        ierr=0;
        return it->second.c_str();
	}	
}

extern "C"{
    hashTable* hashTable__new_(){
		return new hashTable();
    }
    void hashTable__delete_(hashTable* const itself){
        delete itself;
    }

    void hashTable__clear_(hashTable* itself){
        itself->clear();
    }

    void hashTable__insert_(hashTable* itself,int key,const char* value,int& ierr){
        ierr=itself->Insert(key,value);
    }

    void  hashTable__find_(hashTable* itself,int key,char output[], int& ierr, int f_str_len){
        const char* tmp=itself->Find(key,ierr);
        
        int len=(int)strlen(tmp);
        
        for (int i=0;i<len;i++){
            output[i]=tmp[i];
        }
        //fill the tail with blanks to make compatible with Fortran style string
        for (int i=len;i<f_str_len;i++){
            output[i]=' ';
        }
    }

    char* create__char_(int length){
        return new char(length);
    }

    void delete__char_(char* const itself){
        delete[]  itself;
    }
}
