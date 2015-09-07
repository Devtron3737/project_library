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
#1-split words at " " = words_array
#2-words array into letters array
#3-puts arr[0].upcase
#4-letters.join
#5-words.join with spaces between


def capitalize_words(string)

	words_array = string.split(" ") 						# how, are, you
	
	result = []
	result_final = []
	letters_array = []
	i = 0							

	while i < words_array.length
	letters_array = words_array[i].split("") 				#h,o,w
	letters_array[0]=letters_array[0].upcase									#H
	upcased_word = letters_array.join("")						#How									#How 
	result.push(upcased_word)           					#[How]

	i += 1           										#[How, Are, You]
	end

	
	
result_final = result.join(" ")




	 return result_final
end

puts capitalize_words("hello world")
