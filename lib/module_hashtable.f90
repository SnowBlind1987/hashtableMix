
module test_hash
use ISO_C_BINDING,only: c_int, c_char,c_ptr,c_null_ptr
implicit none
type string_hash
    private
    type(c_ptr)::hash_ptr=c_null_ptr
end type string_hash

INTERFACE
    function C_hashTable__new() result(itself) bind(C,name="hashTable__new_")
        use iso_c_binding,only:c_ptr
        implicit none
        type(c_ptr)::itself
    END function C_hashTable__new

    SUBROUTINE C_hashTable__delete(itself) bind(C,name="hashTable__delete_")
        use iso_c_binding,only:c_ptr
        implicit none
        type(c_ptr),value,intent(in)::itself
    END SUBROUTINE C_hashTable__delete

   SUBROUTINE C_hashTable__clear(itself) bind(C,name="hashTable__clear_")
        USE iso_c_binding, only: c_ptr
        implicit none
        type(c_ptr),value,intent(in)::itself
   END SUBROUTINE C_hashTable__clear 

   SUBROUTINE C_hashTable__insert(itself,key,str_value,ierr) bind(C,name="hashTable__insert_")
        use iso_c_binding,only:c_ptr,c_char,c_int
        implicit none
        type(c_ptr),value,intent(in)::itself
        integer(c_int),value,intent(in)::key
        character(c_char),intent(in)::str_value(*)
        integer(c_int),intent(out)::ierr
   END SUBROUTINE C_hashTable__insert
   
   subroutine C_hashTable__find(itself,key,str_value,ierr) bind(C,name="hashTable__find_")
        use iso_c_binding,only:c_ptr,c_char,c_int
        implicit none
        type(c_ptr),value,intent(in)::itself
        integer(c_int),value,intent(in)::key
        character(c_char),intent(inout)::str_value(*)
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

subroutine hashTable__new(itself1)
    type(string_hash),intent(out)::itself1
    itself1%hash_ptr= C_hashTable__new()
end subroutine hashTable__new

subroutine hashTable__delete(itself1)
    type(string_hash),intent(inout)::itself1
    call C_hashTable__delete(itself1%hash_ptr)
    write(*,*) "out of c"
    itself1%hash_ptr=c_null_ptr
end subroutine hashTable__delete

subroutine hashTable__clear(itself1)
    type(string_hash),intent(in)::itself1
    call C_hashTable__clear(itself1%hash_ptr)
end subroutine hashTable__clear

subroutine hashTable__insert(itself1,key,str_value,ierr)
    use iso_c_binding,only:c_char,c_null_char
    implicit none
    type(string_hash),intent(in)::itself1
    integer,intent(in)::key
    character(len=*),intent(inout)::str_value
    integer,intent(inout)::ierr
    str_value=adjustl(trim(str_value))//c_null_char
    call C_hashTable__insert(itself1%hash_ptr,int(key,c_int),str_value,ierr)
end subroutine hashTable__insert
!
subroutine hashTable__find(itself1,key,str_value,ierr)
    use iso_c_binding
    implicit none
    type(string_hash),intent(in)::itself1
    integer,intent(in)::key
    integer::length
    character(len=*),intent(inout)::str_value
    character(c_char),allocatable::c_str(:)
    integer,intent(out)::ierr
    type(c_ptr)::ptr_char
    character,pointer::test(:)
    integer::i
    allocate(c_str(33))
    length=len(str_value)
    do i=1,length
        str_value(i:i)="0"
    enddo
    c_str=trim(adjustl(str_value))//c_null_char
    !ptr_char=C_create__char(length)
    call C_hashTable__find(itself1%hash_ptr,int(key,c_int),c_str,ierr)
    write(*,*) "past find"
    !call C_F_POINTER(ptr_char,test,[7])
    !call C_delete__char(ptr_char)
    ptr_char=c_null_ptr
    write(*,*) "conversion"
    write(*,*) test(1)
end subroutine hashTable__find

end module test_hash
