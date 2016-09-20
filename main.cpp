#include <iostream>
#include <string>
#include "hashTable.h"
//#include <unordered_map>

using std::cout;
using std::endl;
int main(){
    hashTable myHash;
	myHash.hashInit();
    char value[] ="testing";
    int key=2;
    myHash.insert(key,value);
	char* output;
    int ierr;
    myHash.find(2,output,ierr);
	if (ierr!=-1){
		cout<<output<<endl;
	}
	else{
		cout<<"key not found"<<endl;
	}
}
