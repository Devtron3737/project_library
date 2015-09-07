# largest prime factor of 600851475143
#wont computes

def large
i = 2
answer = 0
until i == 300851475143
x = Prime.new(i)
 	if x.prime?(i)
 		if 600851475143 % i == 0
 		answer = i
 		end
 	i += 1
	else i += 1
	end
end

return answer
end

puts large




# nums = (0..600).to_a

# n = 1

# until n = 300425737571
# 	if 600851475143 / 
# factors = []
# prime_factors = []

# nums.each do |n|
# 	if 600851475142 % n == 0
# 		factors << n
# 	end
# end

# factors.each do |x| 
# 	if prime?(x) == true
# 		prime_factors << x
# 	end
# end




