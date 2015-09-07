# Write a method that takes in a string. Your method should return the
# most common letter in the array, and a count of how many times it
# appears.
#
# Difficulty: medium.


def most_common_letter(string)
letters = {}
letters.default = 0	
string.each_char do |letter| letters["#{letter}"] += 1 unless letter == " " end
	letter_counts = letters.invert.sort.reverse
	arr = letter_counts[0]
	return letter_counts[0].reverse
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts(most_common_letter("abbabccccc"))

puts(
  'most_common_letter("abca") == ["a", 2]: ' +
  (most_common_letter('abca') == ['a', 2]).to_s
)
puts(
  'most_common_letter("abbab") == ["b", 3]: ' +
  (most_common_letter('abbab') == ['b', 3]).to_s
)