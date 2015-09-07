#first trianlge number to have over 500 divisors
#triangle number 5 is 1 + 2 + 3 + 4 + 5

def triangle_num

divisors = 0
n = 2

until divisors > 500
	sum = 0
	(1..n).to_a.each do |x| sum += x end
	(1..sum - 1).to_a.each do |y|
		if sum % y == 0
			divisors += 1
			if divisors > 500 
				return sum
			end
		end
	end
divisors = 0
n += 1
end
end

puts triangle_num

