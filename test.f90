program test
    use test_hash
    !include"exernal_call.h"
    implicit none
    type(string_hash):: hash
    character(len=33):: test_val,ret_val,tmp
    integer::i,key,ierr
    
    call hashNew(hash)
    call hashClear(hash)
    do i=1,2
        write(tmp,*) i
        test_val="testing_"//trim(adjustl(tmp))
        write(*,*) test_val
        call hashInsert(hash,i,test_val,ierr)
        if (ierr/=0) then 
            write(*,*) "Error, insertion problem!"
            exit 
        endif
    enddo

    do i=1,2
        call hashFind(hash,i,ret_val,ierr)
        if (ierr/=0) then 
            write(*,*) "Cannot find value!"
            exit
        endif
        write(*,*) trim(adjustl(ret_val))
    enddo
    call hashDel(hash)
end program test
