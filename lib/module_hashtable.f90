
module string_hash
use ISO_C_BINDING,only: c_int, c_char,c_ptr,c_null_ptr
implicit none
type string_hash
    private
    type(c_ptr)::hash_ptr=c_null_ptr
end type string_hash

INTERFACE
    SUBROUTINE hashTable__new(itself) bind(C,name="hashTable__new")
        use iso_c_binding,only:c_ptr
        type(c_ptr),intent(inout)::itself
    END SUBROUTINE hashTable_new

    SUBROUTINE hashTable__delete(itself) bind(C,name="hashTable__delete")
        use iso_c_binding,only:c_ptr
        type(c_ptr),intent(in)::itself
    END SUBROUTINE

   SUBROUTINE hashTable__clear(itself) bind(C,name="hashTable__init")
        USE iso_c_binding, only: c_ptr
        type(c_ptr),intent(in)::itself
   END SUBROUTINE hashTable__init 

   SUBROUTINE hashTable__insert(itself,key,value) bind(C,name="hashTable__insert")
        use iso_c_binding,only:c_ptr,c_char,c_int
        type(c_ptr)::itself
        integer(c_int),value,intent(in)::key
        character(c_char),intent(in)::value(*)
   END SUBROUTINE hashTable_insert

   SUBROUTINE hashTable__find(itself,key,value,ierr) bind(C,name="hashTable_find")
        use iso_c_binding,only:c_ptr,c_char,c_int
        type(c_ptr),intent(in)::itself
        integer(c_int),value,intent(in)::key
        character(c_char),intent(out)::value(*)
        integer(c_int),intent(out)::ierr
   END SUBROUTINE hashTable_find
END INTERFACE
    

CONTAINS

subroutine stringHashNew(itself)
    type(string_hash),intent(inout)::itself
    call hashTable__new(itself&hash_ptr)
end subroutine stringHashNew

subroutine stringHashDel(itself)
    type(string_hash),intent(inout)::itself
    call hashTable__delete(itself%hash_ptr)
    itself%hash_ptr=c_ptr_null
end subroutine stringHashDel

subroutine stringHashClear(itself)
    type(string_hash),intent(inout)::itself
    call hashTable__init(itself%hash_ptr)
end subroutine stringHashClear

subroutine stringHashInsert(itself,key,value)
    use iso_c_binding,only:c_char
    type(string_hash),intent(in)::itself
    integer,intent(in)::key
    character(len=*),intent(in)::value
    character(type=c_char,len=33)::c_str
    c_str=adjustl(trim(value))//"/0"
    call hashTable__insert(itself%hash_ptr,key,value)
end subroutine stringHashInsert

subroutine stringHashFind(itself,key,value,ierr)
    implicit none
    use iso_c_binding,only:c_char
    type(string_hash),intent(in)::itself
    integer,intent(in)::key
    character(len=*),intent(out)::value
    integer,intent(out)::ierr
    character(type=c_char,len=33)::c_str
    call stringHash__find(itself%hash_ptr,key,c_str,ierr)
    !need to set value to c_string
end subroutine stringHashFind


end module string_hash
