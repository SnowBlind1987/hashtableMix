#ifndef HASHTABLE_H
#define HASHTABLE_H
#include <boost/unordered_map.hpp>
#include <string>
class hashTable{
    private:
        boost::unordered_map<int,std::string> myHash_;
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
