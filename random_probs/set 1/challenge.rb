
def crazy_sum(arr)
result = []

i = 0

while i < arr.length
	result.push(arr[i] * i)
	i += 1
end
sum = 0
y = 0
while y < result.length
	sum = sum + result[y]
	y += 1
end

return sum


end

#___________________________

def square_nums(num)
	i = 0

	while (i ** 2) < num
		i += 1
	end

	return i - 1
end

#__________________________________

def crazy_nums(num)
i = 0
result = []

while i < num
	if (i % 3 == 0) && (i % 5 == 0)
		i += 1

	elsif i % 3 == 0
		result.push(i)
		i += 1

	elsif i % 5 == 0
		result.push(i)
		i += 1

	else
		i += 1
	end

end

return result
end







