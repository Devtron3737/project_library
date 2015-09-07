# Write a method that takes in a number and returns true if it is a
# power of 2. Otherwise, return false.
#
#
# Difficulty: medium.

# until 2^i <= num
#	if 2 ^ i == num
#    return true
#return false

def is_power_of_two?(num)
i = 0

while 2 ** i <= num
	if 2 ** i == num
		return true
	end
	i += 1
end
return false

end

puts 2 ** 2

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts('is_power_of_two?(1) == true: ' + (is_power_of_two?(1) == true).to_s)
puts('is_power_of_two?(16) == true: ' + (is_power_of_two?(16) == true).to_s)
puts('is_power_of_two?(64) == true: ' + (is_power_of_two?(64) == true).to_s)
puts('is_power_of_two?(78) == false: ' + (is_power_of_two?(78) == false).to_s)
puts('is_power_of_two?(0) == false: ' + (is_power_of_two?(0) == false).to_s)