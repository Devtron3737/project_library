# Write a method that takes a string and returns true if it is a
# palindrome. A palindrome is a string that is the same whether written
# backward or forward. Assume that there are no spaces; only lowercase
# letters will be given.
#
# Difficulty: easy.
# take string and push last letter to new array
# if new array == string, return true
# else return false

def palindrome?(string)
i = string.length - 1
pal = []

while i >= 0
	pal.push(string[i])
	i -= 1
end

palindrome = pal.join("")
if palindrome.to_s == string
	return true
end

return false


end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts('palindrome?("abc") == false: ' + (palindrome?('abc') == false).to_s)
puts('palindrome?("abcba") == true: ' + (palindrome?('abcba') == true).to_s)
puts('palindrome?("z") == true: ' + (palindrome?('z') == true).to_s)