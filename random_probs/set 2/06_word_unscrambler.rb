# Write a function word_unscrambler that takes two inputs: a scrambled
# word and a dictionary of real words.  Your program must then output
# all words that our scrambled word can unscramble to.
#
# Hint: To see if a string `s1` is an anagram of `s2`, split both
# strings into arrays of letters. Sort the two arrays. If they are
# equal, then they are anagrams.
#
# Difficulty: 3/5
#

def word_unscrambler(word, dictionary)
result = []
dictionary.each do |entry|
	if entry.split("").sort.join("") == word.split("").sort.join("")
		result << entry
	end
end
result 
end


puts word_unscrambler("cat", ["tic", "toc", "tac", "toe"])
puts ["tac"]
puts word_unscrambler("turn", ["numb", "turn", "runt", "nurt"])
puts ["turn", "runt", "nurt"]
