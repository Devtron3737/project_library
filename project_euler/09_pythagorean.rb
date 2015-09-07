# find pythagorean triplet ex: a2 + b2 = c2, where a + b + c = 1000. find a * b * c

a = 1
b = 2
done = false
until done == true

	c = ((a**2)+(b**2))**0.5 
		
	if (a + b + c == 1000)
		done = true

	else 
		a = rand(1..997)
		b = rand(1..997)
		done = false
	end
end

puts a*b*c


