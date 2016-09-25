program test
    use test_hash
    !include"exernal_call.h"
    implicit none
    type(string_hash):: hash
    character(len=30):: test_val
    character(len=30)::val
    integer::key,ierr
    val="testing"
    key=2
    call hashNew(hash)
    call hashInsert(hash,key,val,ierr)
    call hashFind(hash,key,test_val,ierr)
    call hashClear(hash)
    call hashDel(hash)
    write(*,*) "past where I'm supposed to be" 
end program test
