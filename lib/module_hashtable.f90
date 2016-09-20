
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

   SUBROUTINE hashTable__init(itself) bind(C,name="hashTable__init")
        USE iso_c_binding, only: c_ptr
        type(c_ptr),intent(in)::itself
   END SUBROUTINE hashTable__init 

   SUBROUTINE hashTable__insert(itself,key,value) bind(C,name="hashTable__insert")
        use iso_c_binding,only:c_ptr,c_char,c_int
        type(c_ptr)::itself
        integer(c_int),value,intent(in)::key
        character(c_char),intent(in)::value
   END SUBROUTINE hashTable_insert

   SUBROUTINE hashTable__find(itself,key,value,ierr) bind(C,name="hashTable_find")
        use iso_c_binding,only:c_ptr,c_char,c_int
        type(c_ptr),intent(in)::itself
        integer(c_int),value,intent(in)::key
        character(c_char),intent(out)::value
        integer(c_int),intent(out)::ierr
   END SUBROUTINE hashTable_find
END INTERFACE
    
end type end module string_hash
