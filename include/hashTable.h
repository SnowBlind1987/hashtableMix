#ifndef HASHTABLE_H
#define HASHTABLE_H
#include <unordered_map>

class hashTable{
    private:
        std::unordered_map<int,char*> myHash;
    public:
        // hashTable();
        //~hashTable();
		void clear();
        void insert(int,char*);
        char* find(int,int &);
};


#endif
