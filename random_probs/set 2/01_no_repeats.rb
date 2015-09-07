# Write a function, `no_repeats(year_start, year_end)`, which takes a
# range of years and outputs those years which do not have any
# repeated digits.
#
# You should probably write a helper function, `no_repeat?(year)` which
# returns true/false if a single year doesn't have a repeat.
#
# Difficulty: 1/5
# write two methods. one that puts list out if not repeated digits
#second checks if any digit repeat

def no_repeats(first_year, year_end)
 result = []
 (first_year..year_end).each do |year| 
  if no_repeat?(year) == true
    result.push(year)
  end
end
result
end

def no_repeat?(yr)
  years = []
  yr.to_s.each_char do |num|
    if years.include?(num)
      return false
    end 
    years.push(num)
  end
  return true
end

puts no_repeats(1981, 1991)