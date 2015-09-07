# Write a method that takes an array of numbers. If a pair of numbers
# in the array sums to zero, return the positions of those two numbers.
# If no pair of numbers sums to zero, return `nil`.
#
# Difficulty: medium.

# 

def two_sum(nums)
	io = 0
	i = 1

	while io < nums.length - 1
		while i < nums.length
			if nums[io] + nums[i] == 0
				return [io, i]
			end
			i += 1
		end
		io += 1
		i = io + 1
	end
	return nil

end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts(
  'two_sum([1, 3, 5, -3]) == [1, 3]: ' + (two_sum([1, 3, 5, -3]) == [1, 3]).to_s
)
puts(
  'two_sum([1, 3, 5]) == nil: ' + (two_sum([1, 3, 5]) == nil).to_s
)