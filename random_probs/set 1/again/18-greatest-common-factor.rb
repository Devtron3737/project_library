# Write a method that takes in two numbers. Return the greatest
# integer that evenly divides both numbers. You may wish to use the
# `%` modulo operation.
#
# Difficulty: medium.

# STRATEGY
#
# greatest = variable to store largest common factor
# lowest = lowest number (out of number1 and number2)
# while i < lowest
# if number1 % i == 0 && number2 % i == 0
# (nested if) if i > greatest, greatest = i (end)
# i += 1 (end)
# 


def greatest_common_factor(number1, number2)
	greatest = 1
	i = 1
	if number1 > number2
		lowest = number2
	else lowest = number1
	end

	while i <= lowest
		if (number1 % i == 0) && (number2 % i == 0)
			if i > greatest
				greatest = i
			end
		i += 1
		end 
	i += 1
	end
	return greatest

end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts greatest_common_factor(3, 9)

puts(
  'greatest_common_factor(3, 9) == 3: ' +
  (greatest_common_factor(3, 9) == 3).to_s
)
puts(
  'greatest_common_factor(16, 24) == 8: ' +
  (greatest_common_factor(16, 24) == 8).to_s
)
puts(
  'greatest_common_factor(3, 5) == 1: ' +
  (greatest_common_factor(3, 5) == 1).to_s
)