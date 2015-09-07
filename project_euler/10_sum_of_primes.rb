# find sum of primes below 2 million. ex primes below 10 are 2, 3, 5, 7 = 17

def prime?(n)
nums = (2..n - 1).to_a
nums.each do |x| 
	if n % x == 0
		return false
	end
end
true
end


i = 2
sum = 0

while i < 2000000
	if prime?(i) == true
		sum += i
		i += 1
	else i += 1
	end
end

puts sum