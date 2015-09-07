#smallest number divisible by all numbers from 1 - 20
#wont compute

i = 100
nums = (1..20).to_a

done = false
until done == true
done = true
nums.each do |n|
	if i % n != 0
		done = false
		i += 1
		break
	end
end
end

puts i
