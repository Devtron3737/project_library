# Write a method that takes in a string. Your method should return the
# most common letter in the array, and a count of how many times it
# appears.
#
# Difficulty: medium.

# have io, then if string[io] == string[i], if true, count += 1 if count > final_count, final_count = count and letter = string[i]


def most_common_letter(string)
io = 0
i = 1
count = 0
final_count = 0

while io < string.length
	while i < string.length
		if string[io] == string[i]
			count += 1
			if count > final_count
				final_count = count
				letter = string[i]
			end
		end
	i += 1
	end
io += 1
i = io + 1
count = 0
end

return [letter, final_count + 1]


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