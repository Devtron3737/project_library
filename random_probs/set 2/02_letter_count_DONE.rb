# Write a function, `letter_count(str)` that takes a string and
# returns a hash mapping each letter to its frequency. Do not include
# spaces.
#
# Difficulty: 1/5

def letter_count(str)
letters = Hash.new(0)
	str.each_char do |letter| letters[letter] += 1 end
		return letters
end

puts letter_count("a bb ccc")
