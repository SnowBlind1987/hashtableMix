#include "hashTable.h"
//#include <unordered_map>

using namespace std;
extern "C"{
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
	auto it=myHash->begin();

	for(it;it!=myHash->end();it++ ){
		myHash->erase(it);
	}
}

int hashTable::find(int key,char* & output){
	auto it=myHash->find(key);
	if (it==myHash->end()){
		return -1;
	}
    else{
		output=it->second;
		return 0;
	}	
}

}
