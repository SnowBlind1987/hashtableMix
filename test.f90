program main
use test_hash
implicit none
type(string_hash):: hash
character(len=*):: test_val
integer::key
call stringHashNew(hash) 
end program main
