#ifndef HASHTABLE_H
#define HASHTABLE_H
#include <unordered_map>
using namespace std;

class hashTable{
    private:
        unordered_map<int,char*>* myHash;
    public:
        hashTable();
        ~hashTable();
        void insert(int,char*);
        char* find(int);
};


#endif
