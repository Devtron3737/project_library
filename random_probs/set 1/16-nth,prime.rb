# Write a method that returns the `n`th prime number. Recall that only
# numbers greater than 1 can be prime.
#
# Difficulty: medium.



def nth_prime(n)
  nums = (0..10000).to_a
  result = []

  nums.each do |i| 
    if prime?(i) == true
      result.push(i)
    end
  end


  return result[n]
end



def prime?(number)
  
  if number == 2
    return true
  elsif number == 3
    return true
  elsif number == 5
    return true
  elsif number == 7
    return true
  elsif (number % 2 != 0) && (number % 3 != 0) && (number % 5 != 0) && (number % 7 != 0)
    return true
  else return false
  end
end

puts nth_prime(4)

# These are tests to check that your code is working. After writing
# your solution, they should all print true.
#puts nth_prime(2)

puts('nth_prime(1) == 2: ' + (nth_prime(1) == 2).to_s)
puts('nth_prime(2) == 3: ' + (nth_prime(2) == 3).to_s)
puts('nth_prime(3) == 5: ' + (nth_prime(3) == 5).to_s)
puts('nth_prime(4) == 7: ' + (nth_prime(4) == 7).to_s)
puts('nth_prime(5) == 11: ' + (nth_prime(5) == 11).to_s)