#ifndef HASHTABLE_H
#define HASHTABLE_H
#include <unordered_map>
#include <string>
class hashTable{
    private:
        std::unordered_map<int,std::string> myHash_;
    public:
         hashTable();
        ~hashTable();
		void clear();
		void showAll();
        int Insert(int,const char*);
        const char* Find(int,int &);
};

void hashTable_delete(hashTable*);
void hashTable_clear(hashTable*);
void hashTable_insert(hashTable*, int, const char*);
void hashTable_find(hashTable*,int,char* &, int&);

#endif
