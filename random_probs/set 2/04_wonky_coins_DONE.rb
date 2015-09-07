
# Catsylvanian money is a strange thing: they have a coin for every
# denomination (including zero!). A wonky change machine in
# Catsylvania takes any coin of value N and returns 3 new coins,
# valued at N/2, N/3 and N/4 (rounding down).
#
# Write a method `wonky_coins(n)` that returns the number of coins you
# are left with if you take all non-zero coins and keep feeding them
# back into the machine until you are left with only zero-value coins.
#
# Difficulty: 3/5

# this has arrays within an array. so, keep pushing the arrays onto a main array. call main array "coins".
# if coins.include?(/[123456789]/)  scan coins for numbers unless 0. then push [number/2, number/3, number/4] to coins
#
# have to have exception for initial input
#  sum = num
# while sum > 0
# ...write code (pushing stuff to coins array)
# coins.to_s.each_char { |a| sum += a.to_i}
# end while loop
# puts arr.to_s.scan(/\w/) { |b| result.push(b)}
# puts result.length

# what am i returning? coins.scan(0) do |zeroes| result.push(zeroes)
# return result.length

def wonky_coins(n)
  return 1 if n == 0


return wonky_coins(n/2) + wonky_coins(n/3) + wonky_coins(n/4)
end

puts wonky_coins(1)
puts 3
puts wonky_coins(5)
puts 11
puts wonky_coins(6)
puts 15
puts wonky_coins(0)
puts 1




