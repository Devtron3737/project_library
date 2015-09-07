#find sum of all multiples of 3 & 5 below 1000

multiples = []

nums = (1..999).to_a

nums.each do |n| 
	if n % 3 == 0 || n % 5 == 0
		multiples.push(n)
	end
end
sum = 0
multiples.each do |x| sum += x end
puts sum
