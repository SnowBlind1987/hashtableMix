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
