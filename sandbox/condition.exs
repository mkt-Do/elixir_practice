# case clause
c = fn a, b ,c ->
  case {a, b, c} do # case allows us to compare a value ageinst many patterns until we find a matching one
    {4, 5, 6} -> "This clause won't match"
    {1, x, 3} -> "This clause will match and bind x to #{x} in this clause"
    _ -> "This clause would match any value"
  end
end
IO.puts c.(1, 2, 3) # This clause will match and bind x to 2 in this clause
IO.puts c.(4, 5, 6) # This clause won't match
IO.puts c.(3, 1, 4) # This clause would match any value

x = 1
cc = fn a -> 
  case a do
    ^x -> "Will match" # if you wanna patternmatch against an existing variable, you need to use ^(pin) operator
    _ -> "Won't match"
  end
end
IO.puts cc.(1) # Will match
IO.puts cc.(2) # Won't match

ccc = fn a, b, c ->
  case {a, b, c} do
    {1, x, 3} when x > 0 -> "Will match x = #{x}" # clauses also allow extra conditions to be specified via guards("when")
    _ -> "Won't match"
  end
end
IO.puts ccc.(1, 2, 3) # Will match x = 2
IO.puts ccc.(1, -2, 3) # Won't match
IO.puts ccc.(4, 5, 6) # Won't match

# expressions in guard clauses
# hd(1) # error (beacuse arg is not list)
c = fn a ->
  case a do
    x when hd(x) -> "Won't match" # if errors occur in guard clause, don't throw error
    x -> "Got: #{x}"
  end
end
IO.puts c.(1) # Got: 1
c = fn a ->
  case a do
    :error -> "Won't match"
  end
end
# IO.puts c.(:ok) # error (because none of clauses match)
f = fn
  x, y when x > 0 -> x + y
  x, y -> x * y # same a number of args on the one
end
IO.puts f.(1, 3) # 4
IO.puts f.(-1, 3) # -3

# cond (cond is used when we wanna to find the first one that evaluates to true until we check different conditions whether it matches)
c = cond do # I understand this is like "else-if" clause
  2 + 2 == 5 -> "This will not be true"
  2 * 2 == 3 -> "Nor this"
  1 + 1 == 2 -> "But this will"
end
IO.puts c # But this will
c = cond do
  2 + 2 == 5 -> "This is never true"
  2 * 2 == 3 -> "Nor this"
  true -> "This is always true"
end
IO.puts c # This is always true (cond considers any value as true except nil/false)
c = cond do
  hd([1, 2, 3]) -> "1 is considered as true"
end
IO.puts c # 1 is considered as true

# if/unless (if/unless use when you need to check for just one condition) (if/unless have two args ?)
i = if true do
  "This works"
end
IO.puts i # This works
u = unless true do
  "This will never be seen"
end
IO.puts u # nil
i = if nil do
  "This won't be seen"
else
  "This will"
end
IO.puts i # This will

# do blocks
i = if true, do: 1 + 2 # do/end blocks are a convenience for passing a group of expressions to "do:"
IO.puts i # 3
i = if true do
  a = 1 + 2
  a + 10
end
IO.puts i # 13
i = if true, do: (
  a = 1 + 2
  a + 10
)
IO.puts i # 13 (same on the one)
i = if false, do: :this, else: :that
IO.puts i # that
# do/end blocks is they are always bound to the outermost function call
# i = is_number if true do
#    1 + 2
# end
# On the one has error because this clause is same as
# i = is_number(if true) do
#   1 + 2
# end
# so you must use parenthesis to resolve ambiguity
i = is_number(if true do
  1 + 2
end)
IO.puts i # true

