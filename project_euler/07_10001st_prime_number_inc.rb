# what is 10_001 prime number?
#wont compute

def prime?(n)
nums = (2..n - 1).to_a
nums.each do |x|
	if n % x == 0
		return false
	end
end
return true
end


primes = []
i = 2
until primes.length == 10001
	if prime?(i) == true
		primes << i
		i += 1
	else i += 1
	end
end
puts primes.last


