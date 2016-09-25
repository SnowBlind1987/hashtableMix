#ifndef HASHTABLE_H
#define HASHTABLE_H
#include <unordered_map>

class hashTable{
    private:
        std::unordered_map<int,const char*> myHash_;
    public:
         hashTable();
        ~hashTable();
		void clear();
        int insert(int,const char*);
        const char* find(int,int &);
};

void hashTable_delete(hashTable*);
void hashTable_clear(hashTable*);
void hashTable_insert(hashTable*, int, const char*);
void hashTable_find(hashTable*,int,char* &, int&);

#endif
