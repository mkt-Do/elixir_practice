# string
string = "string" # define string
IO.puts string # string
IO.puts is_binary string # true

# utf-8
string = "hełło"
IO.puts string # hełło
IO.puts byte_size string # 7 (because ł is 2 bytes)
IO.puts String.length string # 5
IO.puts ?a # 97
IO.puts ?ł # 322
IO.inspect String.codepoints("hełło") # ["h", "e", "ł", "ł", "o"] (split a string)

# binaries
binary = <<0, 1, 2, 3>> # define binary
IO.inspect binary # <<0, 1, 2, 3>> (binary is defined by "<<" and ">>")
IO.puts byte_size binary # 4
IO.puts String.valid?(<<239, 191, 191>>) # true (binary may not be valid as a string)
binary = <<1, 2>> <> <<3, 4>> # concatenate (string concatenation)
IO.inspect binary # <<1, 2, 3, 4>>
binary = "hełło" <> <<0>> # concatenate (add null byte)
IO.inspect binary # <<104, 101, 197, 130, 197, 130, 111, 0>>
IO.inspect <<255>> # <<255>>
IO.inspect <<256>> # <<0>> byte is from 0 to 255
IO.inspect <<256 :: size(16)>> # <<1, 0>> (use 16bit (2bytes))
IO.inspect << 256 :: utf8>> # A (the number is a code point)
IO.inspect <<256 :: utf8, 0>> # <<196, 128, 0>>
IO.inspect <<1 :: size(1)>> # <<1 :: size(1)>> (pass a size of 1 bit)
IO.inspect <<2 :: size(1)>> # <<0 :: size(1)>> (1bit is from 0 to 1)
IO.inspect is_binary(<<1 :: size(1)>>) # false (not binary but bitstring)
IO.inspect is_bitstring(<<1 :: size(1)>>) # true
IO.inspect bit_size(<<1 :: size(1)>>) # 1

# pattern match
<<0, 1, x>> = <<0, 1, 2>> # x binds 2
IO.puts x # 2
# <<0, 1, x>> = <<0, 1, 2, 3>> # error (not match a size of binaries)
<<0, 1, x :: binary>> = <<0, 1, 2, 3>> # x binds <<2, 3>>
IO.inspect x # <<2, 3>> (you can match on the rest of the binary modifier)
"he" <> rest = "hello" # rest is "llo"
IO.puts rest # llo

# char lists
bitstr = 'hełło' # single quote is defined as code point array
IO.inspect bitstr # [104, 101, 322, 322, 111]
IO.puts is_list bitstr # true
string = "hełło" # define
IO.inspect to_char_list string # [104, 101, 322, 322, 111] (deprecated)
IO.puts to_string 'hełło' # hełło
IO.puts to_string :string # string
IO.puts to_string 1 # 1
