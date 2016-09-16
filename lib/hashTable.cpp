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


char* hashTable::find(int key){
    return (*myHash)[key];
}
