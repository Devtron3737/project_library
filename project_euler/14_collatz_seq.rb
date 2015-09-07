#which startin number produces the longest chain
# n is even => n/2
#n is odd => 3n + 1

num = 3
seq = []
winner = ""
longest = 0
until num == 999999
seq.push(num)	
	until seq.last == 1
		if num % 2 == 0
			seq.push(num/2)
		else seq.push((3*num) + 1)
		end

		if seq.length > longest
			winner = seq[0]
		end
	end
num = seq[0] + 1	
seq = []
end

puts winner





