# integer
IO.puts 1
IO.puts 1 + 2
IO.puts 5 * 5
IO.puts div(10, 2) # get only integer division
IO.puts div 10, 2 # same as on the one
IO.puts rem(10, 3) # get only division remainder
IO.puts rem 10, 3 # same as on the one
IO.puts 0b1010 # binary
IO.puts 0o777 # octal
IO.puts 0x1F # hexadecimal

# float
IO.puts 10 / 2 # result is float 5.0
IO.puts 1.0e-10 # can use e for exponent number
IO.puts round 3.58 # round off
IO.puts trunc 3.58 # truncate to get integer part of a float

# boolean
IO.puts true # true
IO.puts true == false # evaluate
IO.puts is_boolean true # evaluate whether arg is true
IO.puts is_boolean 1 # this arg is not boolean
IO.puts is_integer 1 # this arg is integer
IO.puts is_float 1.0 # this arg is float

# atom (atoms are constants where their name is their own value)
IO.puts :atom # result is atom
IO.puts :atom == :atoms # false
IO.puts true == :true # true
IO.puts is_atom(:atom) # true
IO.puts is_atom(true) # true (true/false is atom)

# string (between double quotes, and are encoded in UTF-8)
IO.puts "string" # string
IO.puts "Hello #{:world}" # string interpolation
IO.puts "hello\nworld" # use escape sequences
IO.puts is_binary "string" # string is binary in Elixir
IO.puts byte_size "string" # get a number of bytes in string
IO.puts String.length "string" # get a string length
IO.puts String.upcase("string") # convert upcase string
IO.puts "hello" == 'hello' # string between double quotes is not same string between single quotes

# anonymous function
add = fn a, b -> a + b end # define function
IO.puts is_function add # true
IO.puts is_function add, 2 # check a number of args of function (true)
IO.puts is_function add, 1 # same as on the one (false)
IO.puts add.(2, 1) # 3 (require .(dot) to execute anonymous function)
add_two = fn a -> add.(a, 2) end # define function
IO.puts add_two.(2) # 4
# anonymous function are closures
x = 42 # define x
IO.puts (fn -> x = 0 end).() # 0
IO.puts x # 42

# (linked) list
IO.inspect [1, "string", true, 2.0, :atom] # values can be of any type
IO.inspect [1, 2, 3] ++ [4, 5, 6] # be concatenated (add list)
IO.inspect [1, 2, 3] -- [1, 2] # be subtracted (remove list)
IO.puts length [1, 2, 3] # 3 (a number of list)
IO.puts hd([1, 2, 3]) # 1 (get a first element of list)
IO.inspect tl([1, 2, 3]) # [2, 3] (get the remainder of list)
# IO.puts hd([]) # error

# tuple
IO.inspect {1, "string", true, 2.0, :atom} # define tuple
IO.puts tuple_size {1, 2, 3} # 3 (get length of tuple)
IO.puts elem({1, "string"}, 1) # string (get element specified number)
IO.inspect put_elem({1, 2}, 1, "string") # change element specified number element
IO.inspect [1|[2|[3|[]]]] # access the length of a list is a linear operation
