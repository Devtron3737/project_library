# Write a method that takes in a number and returns a string, placing
# a single dash before and after each odd digit. There is one
# exception: don't start or end the string with a dash.
#
# You may wish to use the `%` modulo operation; you can see if a number
# is even if it has zero remainder when divided by two.
#
# Difficulty: medium.

# go through array and push into new array. if odd, push - + arr[i] + -

def dasherize_number(num)
result = []
num_s = num.to_s.split("")
i = 0
while i == 0
	if num_s[i].to_i % 2 != 0
		result.push(num_s[i] + "-")
		i += 1
	end

	if num_s[i].to_i % 2 == 0
	 result.push(num_s[i])
	 i += 1
	end
end

while i < num_s.length - 1
	if num_s[i].to_i % 2 != 0
		result.push("-" + num_s[i] + "-")
	end
	
	if num_s[i].to_i % 2 == 0
	 result.push(num_s[i])
	end
i += 1
end

while i == num_s.length - 1
	if num_s[i].to_i % 2 != 0
		result.push("-" + num_s[i])
		i += 1
	end

	if num_s[i].to_i % 2 == 0
	 result.push(num_s[i])
	 i += 1
	end
end

result_final = result.join.to_s.gsub('--', '-')
return result_final
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts(dasherize_number(322744465323))

puts 4 % 2

puts(
  'dasherize_number(203) == "20-3": ' +
  (dasherize_number(203) == '20-3').to_s
)
puts(
  'dasherize_number(303) == "3-0-3": ' +
  (dasherize_number(303) == '3-0-3').to_s
)
puts(
  'dasherize_number(333) == "3-3-3": ' +
  (dasherize_number(333) == '3-3-3').to_s
)
puts(
  'dasherize_number(3223) == "3-22-3": ' +
  (dasherize_number(3223) == '3-22-3').to_s
)