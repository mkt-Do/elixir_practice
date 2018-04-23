# match operator
x = 1 # match operator
IO.puts x # 1
IO.puts 1 = x # 1 (1 = x is a valid expression, and both the left and right are equal to 1)
# IO.puts 2 = x # error (not match, because the left is 2, but the right is 1)
# 1 = y # error (a variable can only be assigned on the left side of "="

# pattern matching
{a, b, c} = {:hello, "world", 42} # define tuple
IO.puts a # hello
# {a, b, c} = {:hello, "world"} # error (tuples have different sizes)
# {a, b, c} = [:hello, "world", "!"] # error (comparing different types)
{:ok, result} = {:ok, 13} # match (because left value is matched)
IO.puts result # 13
# {:ok, result} = {:error, :oops} # error (because left value is not matched)
[a, b, c] = [1, 2, 3] # can pattern match on lists
IO.puts a # 1
[head | tail] = [1, 2, 3]
IO.puts head # 1
IO.puts tail # [2, 3]
[h|t] = ["string", 1, 2] # h is same header
IO.puts h # string
# [h|t] = [] # error (cannot match empty list)
list = [1, 2, 3] # define list
IO.inspect [0|list] # add element to head

# pin operator
x = 1 # define x
x = 2 # rebound x
y = 1 # define y
# ^y = 2 # error (pin operator "^" can be used when there is no interest in rebinding a variable but rather in matching against its value prior to the match)
{y, ^y} = {2, 1} # ^y is 1 (^y is previous value y binds 2)
IO.puts y # 2
{z, z} = {1, 1} # if same variable uses, it binds same pattern
# {z, z} = {1, 2} # error (because the left z and the right z are same value)
[h|_] = [1, 2, 3] # if you use only the head of the list, you can use assign the tail to underscore("_")
IO.puts h # 1
# IO.puts _ # error (cannot read variable "_")
# length([1, 2, 3]) = 3 # error (cannot use function in the left)

