# Write a method, `ordered_vowel_words(str)` that takes a string of
# lowercase words and returns a string with just the words containing
# all their vowels (excluding "y") in alphabetical order. Vowels may
# be repeated (`"afoot"` is an ordered vowel word).
#
# You will probably want a helper method, `ordered_vowel_word?(word)`
# which returns true/false if a word's vowels are ordered.
#
# Difficulty: 2/5

def ordered_vowels(str)
	result_fin = []
	str.split(" ").each do |wrd|
		if vowels_ordered?(wrd)
			result_fin << wrd
		end
	end

	return result_fin.join(" ")
end


def vowels_ordered?(word)
	result = []
	vowels = "aeiou"
	word.each_char do |letter|
		if vowels.include?(letter)
			result.push(letter)
		end
	end

	if result.empty?
		return false
	end

	if result == result.sort
		return true
	else return false
	end
end




puts ordered_vowels("abcdf")
puts ordered_vowels("amends")
puts ordered_vowels("complicated")
puts ordered_vowels("this is a test of the vowel ordering system")
puts "this is a test of the system"

 
