# Write a method that takes in a string of lowercase letters and
# spaces, producing a new string that capitalizes the first letter of
# each word.
#
# You'll want to use the `split` and `join` methods. Also, the String
# method `upcase`, which converts a string to all upper case will be
# helpful.
#
# Difficulty: medium.
#---------------------------------------------


def capitalize_words(string)
result = []
string.split(" ").each do |word| result.push(capitalize(word)) end

	return result.join(" ")
end

def capitalize(wrd)
wrd_s = wrd.split("")
upcased = []

upcased.push(wrd_s[0].upcase)

1.upto(wrd.length - 1).each do |i| upcased.push(wrd[i]) end
	return upcased.join("")
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts(capitalize_words("hello how are you"))

puts(
  'capitalize_words("this is a sentence") == "This Is A Sentence": ' +
  (capitalize_words("this is a sentence") == "This Is A Sentence").to_s
)
puts(
  'capitalize_words("mike bloomfield") == "Mike Bloomfield": ' +
  (capitalize_words("mike bloomfield") == "Mike Bloomfield").to_s
)