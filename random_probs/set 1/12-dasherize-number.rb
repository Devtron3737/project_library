# Write a method that takes in a number and returns a string, placing
# a single dash before and after each odd digit. There is one
# exception: don't start or end the string with a dash.
#
# You may wish to use the `%` modulo operation; you can see if a number
# is even if it has zero remainder when divided by two.
#
# Difficulty: medium.

def dasherize_number(num)
	result = []

	num.to_s.split("").each do |dig|
		if dig.to_i % 2 == 0
			result << dig
		else result << "-"
			result << dig
			result << "-"
		end
	end

	if result[0] == "-"
		result.delete_at(0)
	end

	if result[result.length - 1] == "-"
		result.pop
	end

result_fin = ""
result.each do |x| 
	result_fin += x.to_s
end

result_fin.gsub!("--", "-")
result_fin
end



# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts(dasherize_number(203))

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