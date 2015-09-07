# Write a method that takes in a string. Return the longest word in
# the string. You may assume that the string contains only letters and
# spaces.
#
# You may use the String `split` method to aid you in your quest.
#
# Difficulty: easy.

# string_split = string.split
# result = 0
# longest = []
# if string[i].length > result
# result = string[i]

def longest_word(sentence)
result = 0
longest = []
sentence_split = sentence.split(" ")

i = 0
while i < sentence_split.length
	if sentence_split[i].length > result
		result = sentence_split[i].length
		longest = sentence_split[i]
	end
	i += 1
end
return longest

end


# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts(
  'longest_word("short longest") == "longest": ' +
  (longest_word('short longest') == 'longest').to_s
)
puts(
  'longest_word("one") == "one": ' +
  (longest_word('one') == 'one').to_s
)
puts(
  'longest_word("abc def abcde") == "abcde": ' +
  (longest_word('abc def abcde') == 'abcde').to_s
)