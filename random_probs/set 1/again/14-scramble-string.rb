# Write a method that takes in a string and an array of indices in the
# string. Produce a new string, which contains letters from the input
# string in the order specified by the indices of the array of indices.
#
# Difficulty: medium.

# split string into letters: "abcd" = "a", "b", "c"...
# now take the value from positions at the "i" spot
# and assign the i spot of letters to value in result array
# run until i > positions.length
# join result with no spaces
# return the joined result

def scramble_string(string, positions)
	letters = string.split("")
	result = []


	i = 0
	while i < positions.length
		curr_position = positions[i]
		result[curr_position] = letters[i]

		i += 1
	end
	result_final = result.join

	return result_final
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts scramble_string("markov", [5, 3, 1, 4, 2, 0])

puts(
  'scramble_string("abcd", [3, 1, 2, 0]) == "dbca": ' +
  (scramble_string("abcd", [3, 1, 2, 0]) == "dbca").to_s
)
puts(
  'scramble_string("markov", [5, 3, 1, 4, 2, 0]) == "vkaorm"): ' +
  (scramble_string("markov", [5, 3, 1, 4, 2, 0]) == "vkaorm").to_s
)