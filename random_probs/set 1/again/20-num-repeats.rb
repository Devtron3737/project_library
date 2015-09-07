# Write a method that takes in a string and returns the number of
# letters that appear more than once in the string. You may assume
# the string contains only lowercase letters. Count the number of
# letters that repeat, not the number of times they repeat in the
# string.
#
# Difficulty: hard.
#
# io = letter(0)
# i = io + 1
# if io = i  
# 		counter += 1
# 		io += 1, i = io + 1
# when string(io) == string(i), push string(io) to letters
# yo = beginning of letters. y = yo + 1
# if string(io) == string(i)
# while yo < letters.length
# 	while y < letters.lenth
#



def num_repeats(string)
	io = 0
	i = io + 1
	yo = 0
	y = yo + 1
	letters = []
	counter = 0

	while io < string.length
		while i <= string.length
			if string[io] == string[i]
				letters.push(string[io])
				io += 1
				i = io + 1
				while yo < letters.length
						if string[io] == letters[yo]
							io += 1
							i = io + 1
							yo = 1
						else yo += 1
						end
				end

			counter += 1
			end

		i += 1
		end
		io += 1
		i = io + 1
	end
	return counter

end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts('num_repeats("abdbc") == 1: ' + (num_repeats('abdbc') == 1).to_s)
# one character is repeated
puts('num_repeats("aaa") == 1: ' + (num_repeats('aaa') == 1).to_s)
puts('num_repeats("abab") == 2: ' + (num_repeats('abab') == 2).to_s)
puts('num_repeats("cadac") == 2: ' + (num_repeats('cadac') == 2).to_s)
puts('num_repeats("abcde") == 0: ' + (num_repeats('abcde') == 0).to_s)