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
    char* output=new char(10);
    myHash.find(key,output);
    cout<<output<<endl;
    delete output;
}

/*int main(){
    unordered_map <int,char*> myMap;
    char value[] ="testing";
    int key=2;
    myMap.emplace(key,value);
    cout<<"let's hope this works: "<<myMap[key]<<endl;

    return 0;
}*/

/*int main()
{
    unordered_map<string, string> hashtable;
    hashtable.emplace("www.element14.com", "184.51.49.225");
     
    cout << "IP Address: " << hashtable["www.element14.com"] << endl;
     
    return 0;
}
*/
