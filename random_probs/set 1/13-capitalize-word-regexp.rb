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

# make new array x that is each word of string, and then 
# i could put two interpolations in reg exp, one for cap letter and one for rest of word. Ex: "#{cap_letter}#{word}"

def capitalize_words(string)
	words = []
	cap_letters = []

	string.scan(/\w+/) { |word| words.push(word) }  # words = ["hello", "how"...]
	words_join = words.join(" ")
	words_join.to_s.scan(/\w\w/) { |letter| cap_letters.push(letter.upcase)} # cap_letters = ["H", "H"...]

	string_up = string.split(" ").map)
	

	
 return string_up

end

puts capitalize_words("hello how are you")

# These are tests to check that your code is working. After writing
# your solution, they should all print true.


puts(
  'capitalize_words("this is a sentence") == "This Is A Sentence": ' +
  (capitalize_words("this is a sentence") == "This Is A Sentence").to_s
)
puts(
  'capitalize_words("mike bloomfield") == "Mike Bloomfield": ' +
  (capitalize_words("mike bloomfield") == "Mike Bloomfield").to_s
)