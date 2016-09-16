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


void hashTable::find(int key, char* val){
    *val= *(*myHash)[key];
}
