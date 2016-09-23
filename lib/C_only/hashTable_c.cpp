#include<iostream>
#include "hashTable_c.h"
//#include <unordered_map>

using namespace std;

hashTable::hashTable(){
    std::cout<<"Calling constructor\n";
}

hashTable::~hashTable(){
    std::cout<<"Calling destructor\n";
}
void hashTable::insert(int key, char* val){
    this->myHash.insert(make_pair(key,val));
}

void hashTable::clear(){
    //std::cout<<"actually made it to C\n";
	auto it=this->myHash.begin();
    //std::cout<<"past iter\n";

	for(it;it!=myHash.end();it++ ){
		this->myHash.erase(it);
	}
}

char* hashTable::find(int key, int & ierr){
	auto it=this->myHash.find(key);
	if (it==this->myHash.end()){
		ierr=-1;
        char * empty="\0";
        
	}
    else{
        ierr=0;
        return it->second;
	}	
}

