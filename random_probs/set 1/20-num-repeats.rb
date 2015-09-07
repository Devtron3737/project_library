# Write a method that takes in a string and returns the number of
# letters that appear more than once in the string. You may assume
# the string contains only lowercase letters. Count the number of
# letters that repeat, not the number of times they repeat in the
# string.
#
# Difficulty: hard.
#

def num_repeats(string)
nums = Hash.new(0)
count = 0

string.each_char do |letter| nums[letter] += 1 end

nums.keys.each do |key|
	if nums[key] > 1
		count += 1
	end
end
count

end





# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts num_repeats("cadaccc")
puts 2
puts num_repeats("abdbc")
puts 1
puts num_repeats("abcde")
puts 0

# puts('num_repeats("abdbc") == 1: ' + (num_repeats('abdbc') == 1).to_s)
# puts('num_repeats("aaa") == 1: ' + (num_repeats('aaa') == 1).to_s)
# puts('num_repeats("abab") == 2: ' + (num_repeats('abab') == 2).to_s)
# puts('num_repeats("cadac") == 2: ' + (num_repeats('cadac') == 2).to_s)
# puts('num_repeats("abcde") == 0: ' + (num_repeats('abcde') == 0).to_s)