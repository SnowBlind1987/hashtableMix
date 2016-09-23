#include <iostream>
#include <string>
#include "hashTable.h"
#include "external_call.h"
//#include <unordered_map>

using std::cout;
using std::endl;
int main(){
    int key=2;
    int ierr;
    char value[]="testing";
    char* out;
    hashTable* myHash=hashTable_new();
    hashTable_insert(myHash,key,value);
    hashTable_find(myHash,key,out,ierr);
    cout<<out<<endl;
    hashTable_delete(myHash);	
/*//	myHash->clear();
	std::cout<<"printing pointer\n";
	std::cout<<myHash<<std::endl;
    char value[] ="testing";
    int key=2;
    myHash->insert(key,value);
	char* output;
    int ierr;
    output = myHash->find(2,ierr);
	if (ierr!=-1){
	//	cout<<output<<endl;
	}
	else{
	//	cout<<"key not found"<<endl;
	}
	std::cout<<myHash<<std::endl;
	delete myHash;*/
}
