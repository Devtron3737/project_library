#find the largest palindrome made from two 3 digit numbers

def palindrome?(wrd)
	if wrd.to_s.reverse == wrd.to_s
		return true
	end
	return false
end

largest = 0

arr1 = (1..999).to_a
arr2 = (1..999).to_a
 i = 1
 y = 1

while i < arr1.length - 1
	while y < arr2.length - 1
		if palindrome?(arr1[i] * arr2[y]) == true
			if (arr1[i] * arr2[y]) > largest
				largest = arr1[i] * arr2[y]
			end
		end
		y += 1
	end
	i += 1
	y = i + 1
end
puts largest