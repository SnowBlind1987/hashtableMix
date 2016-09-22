
module test_hash
use ISO_C_BINDING,only: c_int, c_char,c_ptr,c_null_ptr
implicit none
type string_hash
!    private
    type(c_ptr)::hash_ptr=c_null_ptr
end type string_hash

INTERFACE
    function hashTable__new() result(itself) bind(C,name="hashTable__new")
        use iso_c_binding,only:c_ptr
        implicit none
        type(c_ptr)::itself
    END function hashTable__new

    SUBROUTINE hashTable__delete(itself) bind(C,name="hashTable__delete")
        use iso_c_binding,only:c_ptr
        implicit none
        type(c_ptr),intent(in)::itself
    END SUBROUTINE hashTable__delete

   SUBROUTINE hashTable__clear(itself) bind(C,name="hashTable__clear")
        USE iso_c_binding, only: c_ptr
        implicit none
        type(c_ptr),intent(in)::itself
   END SUBROUTINE hashTable__clear 

   SUBROUTINE hashTable__insert(itself,key,value) bind(C,name="hashTable__insert")
        use iso_c_binding,only:c_ptr,c_char,c_int
        implicit none
        type(c_ptr)::itself
        integer(c_int),value,intent(in)::key
        character(c_char),intent(in)::value(*)
   END SUBROUTINE hashTable__insert
   
   subroutine hashTable__find(itself,key,value,ierr) bind(C,name="hashTable__find")
        use iso_c_binding,only:c_ptr,c_char,c_int
        implicit none
        type(c_ptr),intent(in)::itself
        integer(c_int),value,intent(in)::key
        character(c_char),intent(out)::value(*)
        integer(c_int),intent(out)::ierr
   END subroutine hashTable__find

 ! function strlen(string)result(len) bind(C,name='strlen')
 !      use iso_c_binding,only:c_char,C_SIZE_T
 !      implicit none
 ! end function strlen
END INTERFACE
    

CONTAINS

subroutine stringHashNew(itself)
    type(string_hash),intent(inout)::itself
    itself%hash_ptr= hashTable__new()
end subroutine stringHashNew

subroutine stringHashDel(itself)
    type(string_hash),intent(inout)::itself
    call hashTable__delete(itself%hash_ptr)
    write(*,*) "out of c"
    itself%hash_ptr=c_null_ptr
end subroutine stringHashDel

subroutine stringHashClear(itself)
    type(string_hash),intent(in)::itself
    call hashTable__clear(itself%hash_ptr)
end subroutine stringHashClear

subroutine stringHashInsert(itself,key,value)
    use iso_c_binding,only:c_char
    type(string_hash),intent(in)::itself
    integer,intent(in)::key
    character(len=*),intent(in)::value
    character(c_char)::c_str(33)
    write(*,*) value
    c_str=adjustl(trim(value))//"/0"
    write(*,*) c_str
    call hashTable__insert(itself%hash_ptr,int(key,c_int),value)
end subroutine stringHashInsert

subroutine stringHashFind(itself,key,value,ierr)
    use iso_c_binding,only:c_char
    type(string_hash),intent(in)::itself
    integer,intent(in)::key
    character(len=*),intent(out)::value
    integer,intent(out)::ierr
    character(c_char)::c_str(33)
    call hashTable__find(itself%hash_ptr,int(key,c_int),c_str,ierr)
    !value=c_str
end subroutine stringHashFind

end module test_hash
