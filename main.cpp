#include <iostream>
#include <string>
#include "hashTable.h"
#include <sstream>
//#include <unordered_map>

using namespace std;
int main(){
int i,ierr;
hashTable * myHash=new hashTable;
unordered_map<int,string> fuckYou;
for (i=0;i<5;i++){
	string s=to_string(i);
	string testing="testing_";
	string total=testing+s;
	cout <<total<<endl;
	ierr=myHash->Insert(i,total.c_str());
	//fuckYou[i]=total;
}
	
myHash->showAll();

for (i=0;i<5;i++){
//	auto it=fuckYou.find(i);
//	cout<<it->second<<endl;
}
delete myHash;
}

