#include<iostream>
#include<string.h>
#include "hashTable.h"

//#include <unordered_map>

using namespace std;

hashTable::hashTable(){
}

hashTable::~hashTable(){
}
int hashTable::insert(int key, const char* val){
    std::cout<<val<<std::endl;
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

const char* hashTable::find(int key, int & ierr){
	auto it=this->myHash_.find(key);
	if (it==this->myHash_.end()){
		ierr=-1;
        const char*   empty=" ";
        return empty; 
	}
    else{
        ierr=0;
        return it->second;
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
        ierr=itself->insert(key,value);
    }

    void  hashTable__find_(hashTable* itself,int key,char* & output, int& ierr){
        const char* tmp=itself->find(key,ierr);
        cout<<"past the find command\n";
        cout<<tmp<<endl;
        int len=(int)strlen(tmp);
        cout<<len<<endl;
        for (int i=0;i<len-1;i++){
            cout<<tmp[i]<<endl;
            output[i]=tmp[i];
        }
    }
}
