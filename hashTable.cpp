#include "hashTable.h"
#include <unordered_map>

using namespace std;


void hashTable::insert(int key, char* val){
    myHash.insert(make_pair(key,val));
}


char* hashTable::find(int key){
    return myHash[key];
}
