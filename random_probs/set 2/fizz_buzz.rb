#fizz buzz

def fizz_buzz
result = []
	0.upto(100).each do |i|
		if (i % 3 == 0) && (i % 5 == 0)
			result.push("fizzbuzz")
		elsif i % 3 == 0
			result.push("fizz")
		elsif i % 5 == 0
			result.push("buzz")
		else result.push(i)
		end
	end
	result
end

puts fizz_buzz
