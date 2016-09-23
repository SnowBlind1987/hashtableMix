#ifndef CALL_EXTERNAL_H
#define CALL_EXTERNAL_H

#include"hashTable.h"
hashTable* hashTable_new();
void hashTable_delete(hashTable*);
void hashTable_clear(hashTable*);
void hashTable_insert(hashTable*, int, char*);
void hashTable_find(hashTable*,int&,char* &, int&);

#endif
