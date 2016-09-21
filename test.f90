program test
    use test_hash
    implicit none
    type(string_hash):: hash
    character(len=30):: test_val
    integer::key,ierr
    call stringHashNew(hash)
    call stringHashClear(hash) 
end program test
