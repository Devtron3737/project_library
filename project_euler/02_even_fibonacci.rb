#consider the terms of the fibonacci sequence that dont exceed 4 million. find sum of all even terms

fib = [1, 2, 3]
sum = 0


until fib.last > 4000000
	fib.push(fib[fib.length - 1] + fib[fib.length - 2])
end

fib.each do |even|
	if even % 2 == 0
		sum += even
	end
end

puts sum



