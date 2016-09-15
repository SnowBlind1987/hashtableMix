#ifndef HASHTABLE_H
#define HASHTABLE_H
#include <unordered_map>
using namespace std;

class stringHash{
    private:
        unordered_map<int,char*> hash_;
    public:
        stringHash();
        ~stringHash();
        void insert(int,char*);
        char* find(int);


}


#endif
