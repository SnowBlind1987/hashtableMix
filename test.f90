program test
    use test_hash
    !include"exernal_call.h"
    implicit none
    type(string_hash):: hash
    character(len=33):: test_val,ret_val
    integer::key,ierr
    call hashNew(hash)
    call hashClear(hash)
    key=2
    test_val="testing"
    call hashInsert(hash,key,test_val,ierr)
    write(*,*) ierr
    call hashFind(hash,key,ret_val,ierr)
    call hashDel(hash)
    write(*,*) ret_val 
end program test
