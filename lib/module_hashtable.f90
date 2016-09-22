
module test_hash
use ISO_C_BINDING,only: c_int, c_char,c_ptr,c_null_ptr
implicit none
type string_hash
    private
    type(c_ptr)::hash_ptr=c_null_ptr
end type string_hash

INTERFACE
    function C_hashTable__new() result(itself) bind(C,name="hashTable__new")
        use iso_c_binding,only:c_ptr
        implicit none
        type(c_ptr)::itself
    END function C_hashTable__new

    SUBROUTINE C_hashTable__delete(itself) bind(C,name="hashTable__delete")
        use iso_c_binding,only:c_ptr
        implicit none
        type(c_ptr),intent(in)::itself
    END SUBROUTINE C_hashTable__delete

   SUBROUTINE C_hashTable__clear(itself) bind(C,name="hashTable__clear")
        USE iso_c_binding, only: c_ptr
        implicit none
        type(c_ptr),intent(in)::itself
   END SUBROUTINE C_hashTable__clear 

   SUBROUTINE C_hashTable__insert(itself,key,value) bind(C,name="hashTable__insert")
        use iso_c_binding,only:c_ptr,c_char,c_int
        implicit none
        type(c_ptr)::itself
        integer(c_int),value,intent(in)::key
        character(c_char),intent(in)::value(*)
   END SUBROUTINE C_hashTable__insert
   
   subroutine C_hashTable__find(itself,key,value,ierr) bind(C,name="hashTable__find")
        use iso_c_binding,only:c_ptr,c_char,c_int
        implicit none
        type(c_ptr),intent(in)::itself
        integer(c_int),value,intent(in)::key
        character(c_char),intent(out)::value(*)
        integer(c_int),intent(out)::ierr
   END subroutine C_hashTable__find

 ! function strlen(string)result(len) bind(C,name='strlen')
 !      use iso_c_binding,only:c_char,C_SIZE_T
 !      implicit none
 ! end function strlen
END INTERFACE

interface hashNew
    module procedure hashTable__new
end interface hashNew

interface hashDel
    module procedure hashTable__delete
end interface hashDel

interface hashClear
    module procedure hashTable__clear
end interface hashClear

interface hashInsert
    module procedure hashTable__insert
end interface hashInsert

interface hashFind
    module procedure hashTable__find
end interface hashFind

CONTAINS

subroutine hashTable__new(itself)
    type(string_hash),intent(out)::itself
    itself%hash_ptr= C_hashTable__new()
end subroutine hashTable__new

subroutine hashTable__delete(itself)
    type(string_hash),intent(inout)::itself
    call C_hashTable__delete(itself%hash_ptr)
    write(*,*) "out of c"
    itself%hash_ptr=c_null_ptr
end subroutine hashTable__delete

subroutine hashTable__clear(itself)
    type(string_hash),intent(in)::itself
    call C_hashTable__clear(itself%hash_ptr)
end subroutine hashTable__clear

subroutine hashTable__insert(itself,key,value)
    use iso_c_binding,only:c_char
    type(string_hash),intent(in)::itself
    integer,intent(in)::key
    character(len=*),intent(in)::value
    character(c_char)::c_str(33)
    write(*,*) value
    c_str=adjustl(trim(value))//"/0"
    write(*,*) c_str
    call C_hashTable__insert(itself%hash_ptr,int(key,c_int),value)
end subroutine hashTable__insert
!
subroutine hashTable__find(itself,key,value,ierr)
    use iso_c_binding,only:c_char
    type(string_hash),intent(in)::itself
    integer,intent(in)::key
    character(len=*),intent(out)::value
    integer,intent(out)::ierr
    character(c_char)::c_str(33)
    call C_hashTable__find(itself%hash_ptr,int(key,c_int),c_str,ierr)
    !value=c_str
end subroutine hashTable__find

end module test_hash
