# Write a method that takes an array of numbers. If a pair of numbers
# in the array sums to zero, return the positions of those two numbers.
# If no pair of numbers sums to zero, return `nil`.
#
# Difficulty: medium.

def two_sum(nums)

nums.each do |i|
	if nums.include?(i * -1) 
		winner = nums.index(i)
		winner2 = nums.index(i * -1)

		return [winner, winner2]
	end
	end
return nil
	
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts two_sum([1, 3, 5, -3])
puts [1, 3]
puts(
  'two_sum([1, 3, 5, -3]) == [1, 3]: ' + (two_sum([1, 3, 5, -3]) == [1, 3]).to_s
)
puts(
  'two_sum([1, 3, 5]) == nil: ' + (two_sum([1, 3, 5]) == nil).to_s
)