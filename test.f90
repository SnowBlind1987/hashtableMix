program test
    use test_hash
    !include"exernal_call.h"
    implicit none
    type(string_hash):: hash
    character(len=30):: test_val
    integer::key,ierr
    call hashNew(hash)
    !call hashClear(hash)
    call hashDel(hash)
    write(*,*) "past where I'm supposed to be" 
end program test
