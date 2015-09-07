# find diff between sum of squares of 0 - 100 and squares of sum of 0 - 100
nums = (0..100).to_a

nums_sum = 0
nums.each do |x| nums_sum += x end

nums_square_sum = nums_sum ** 2

nums_sq = nums.collect do |x| x ** 2 end

nums_sum_square = 0
nums_sq.each do |t| nums_sum_square += t end

puts nums_square_sum - nums_sum_square
