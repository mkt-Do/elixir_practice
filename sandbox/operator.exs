# list operators
IO.inspect [1, 2, 3] ++ [4, 5, 6] # concatenate lists
IO.inspect [1, 2, 3] -- [2] # remove lists

# string operators
IO.puts "foo" <> "bar" # concatenate string

# boolean operators
IO.puts true and true # "and" operator is one of boolean operators(and, or, not)
IO.puts false or is_atom(:example) # "or" operator is one of boolean operators
# IO.puts 1 and true # error (because 1 is not boolean)
IO.puts false and raise("This error will never be raised") # false(or/and only execute the right side if the left side is not enough to determine the result)
IO.puts true or raise("This error will never raised") # true (same on the one)
IO.puts 1 || true # 1 ("||", "&&" and "!" operators accept arguments of any type. And except false/nil will evaluate true.)
IO.puts false || 11 # 11 (same on the one)
IO.puts nil && 13 # nil (same)
IO.puts true && 17 # 17 (same)
IO.puts !true # false (same)
IO.puts !1 # false (same)
IO.puts !nil # true (same)

# comparison operators
IO.puts 1 == 1 # true
IO.puts 1 != 2 # true
IO.puts 1 < 2 # true
IO.puts 1 == 1.0 # true
IO.puts 1 === 1.0 # false (strict when comparing integers and floats)
IO.puts 1 < :atom # true (compare two different data types)
# number < atom < reference < functions < port < pid < tuple < maps < list < bitstring

