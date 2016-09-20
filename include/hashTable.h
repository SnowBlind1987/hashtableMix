#ifndef HASHTABLE_H
#define HASHTABLE_H
#include <unordered_map>

class hashTable{
    private:
        std::unordered_map<int,char*>* myHash;
    public:
        hashTable();
        ~hashTable();
		void hashInit();
        void insert(int,char*);
        void find(int,char* &,int &);
};


#endif
