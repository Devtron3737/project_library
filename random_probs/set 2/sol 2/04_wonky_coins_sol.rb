def wonky_coins(n)
  return 1 if n == 0

  # call wonky_coins from inside itself. This is called *recursion*.
  return wonky_coins(n / 2) + wonky_coins(n / 3) + wonky_coins(n / 4)
end





puts wonky_coins(1)
puts 3
puts wonky_coins(5)
puts 11
puts wonky_coins(6)
puts 15
puts wonky_coins(0)
puts 1