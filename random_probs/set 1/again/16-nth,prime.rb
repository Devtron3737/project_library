# Write a method that returns the `n`th prime number. Recall that only
# numbers greater than 1 can be prime.
#
# Difficulty: medium.

# You may use our `is_prime?` solution.

# the counter is < n
# create a counter that is + 1 when get a true condition for prime. 
# when counter == n, end the while loop

# so if i not divisible by 2, 3, or 7: 'counter + 1' and 'i + 1' (except 7)
# if i divisble, then 'i + 1'
# io = 2. while io < i: io += 1. after while, reset io = 2
# then when count = n, return i


def nth_prime(n)
  counter = 0
  i = 3
  io = 2

  while counter < n
    if io == i
      i += 1
      io = 2
    end

    while io < i
           
      if (i % io == 0)
      i += 1
      io = 2
      end

      if (i % io != 0) && (i % 3 != 0) && (i % 7 != 0) && (i % 2 != 0) || (i == 7)
      counter += 1
      i += 1
      io = 2
      
      else io += 1
      end
    end
  end

return i
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.
puts nth_prime(2)

puts('nth_prime(1) == 2: ' + (nth_prime(1) == 2).to_s)
puts('nth_prime(2) == 3: ' + (nth_prime(2) == 3).to_s)
puts('nth_prime(3) == 5: ' + (nth_prime(3) == 5).to_s)
puts('nth_prime(4) == 7: ' + (nth_prime(4) == 7).to_s)
puts('nth_prime(5) == 11: ' + (nth_prime(5) == 11).to_s)