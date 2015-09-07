# Write a method that takes an array of numbers in. Your method should
# return the third greatest number in the array. You may assume that
# the array has at least three numbers in it.
#
# Difficulty: medium.

# if statements. so if nums[i] > greatest, third_greatest = second_greatest, second_greatest = greatest, greatest = nums[i],


def third_greatest(nums)
	greatest = 0
	second_greatest = 0
	third_greatest = 0
	i = 0

	while i < nums.length - 1
		if nums[i] > greatest
			third_greatest = second_greatest
			second_greatest = greatest
			greatest = nums[i]
			i += 1
		end
		if greatest > nums[i] && nums[i] > second_greatest
			third_greatest = second_greatest
			second_greatest = nums[i]
			i += 1
		end

		if (second_greatest > nums[i]) && (nums[i] > third_greatest)
			third_greatest = nums[i]
			i += 1
		end

		if nums[i] < third_greatest
			i += 1
		end
	end


	return third_greatest

end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts(
  'third_greatest([5, 3, 7]) == 3: ' +
  (third_greatest([5, 3, 7]) == 3).to_s
)
puts(
  'third_greatest([5, 3, 7, 4]) == 4: ' +
  (third_greatest([5, 3, 7, 4]) == 4).to_s
)
puts(
  'third_greatest([2, 3, 7, 4]) == 3: ' +
  (third_greatest([2, 3, 7, 4]) == 3).to_s
)