#include <iostream>
#include <string>
#include "hashTable.h"
//#include <unordered_map>

using namespace std;

int main(){
    hashTable myHash;
    char value[] ="testing";
    int key=2;
    myHash.insert(key,value);
	char* output;
    int ierr=myHash.find(key,output);
	cout<<output<<endl;
}
