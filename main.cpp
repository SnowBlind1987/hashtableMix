#include <iostream>
#include <string>
#include "hashTable.h"
#include <sstream>
//#include <unordered_map>

using namespace std;
int main(){

    hashTable* myHash=hashTable_new();
    int key=2;
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
	delete myHash;
}
	
myHash->showAll();

for (i=0;i<5;i++){
//	auto it=fuckYou.find(i);
//	cout<<it->second<<endl;
}
delete myHash;
}

