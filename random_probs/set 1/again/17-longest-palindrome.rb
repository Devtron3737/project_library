# Write a method that takes in a string of lowercase letters (no
# uppercase letters, no repeats). Consider the *substrings* of the
# string: consecutive sequences of letters contained inside the string.
# Find the longest such string of letters that is a palindrome.
#
# Note that the entire string may itself be a palindrome.
#
# You may want to use Array's `slice(start_index, length)` method,
# which returns a substring of length `length` starting at index
# `start_index`:
#
#     "abcd".slice(1, 2) == "bc"
#     "abcd".slice(1, 3) == "bcd"
#     "abcd".slice(2, 1) == "c"
#     "abcd".slice(2, 2) == "cd"
#
# Difficulty: hard.

# OUTLINE
# longest = longest palindrome
# take string, and slice from io to i, until i is strings length.
# each slice, if palindrome? = true, and slice.length > longest.length, then longest = that slice.
# then io += 1, while io < string.length

def palindrome?(string)
    i = 0

  while i < string.length
    if string[i] != string[(string.length - 1) - i]
      return false
    end

    i += 1
  end

  return true
end

def longest_palindrome(string)
  io = 0
  i = 1
  longest = []
  while io < string.length
    while i <= string.length
      slice = string.slice(io, i)
      palindrome?(slice)
      if palindrome?(slice) == true
        if slice.length > longest.length
          longest = slice
        end
        i += 1
      
      else i += 1
      end
    end
  io += 1
  i = io + 1
  end

  return longest

end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts(
  'longest_palindrome("abcbd") == "bcb": ' +
  (longest_palindrome('abcbd') == 'bcb').to_s
)
puts(
  'longest_palindrome("abba") == "abba": ' +
  (longest_palindrome('abba') == 'abba').to_s
)
puts(
  'longest_palindrome("abcbdeffe") == "effe": ' +
  (longest_palindrome('abcbdeffe') == 'effe').to_s
)