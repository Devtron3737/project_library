
# Write a function, `nearest_larger(arr, i)` which takes an array and an
# index.  The function should return another index, `j`: this should
# satisfy:
#
# (a) `arr[i] < arr[j]`, AND
# (b) there is no `j2` closer to `i` than `j` where `arr[i] < arr[j2]`.
#
# In case of ties (see example below), choose the earliest (left-most)
# of the two indices. If no number in `arr` is larger than `arr[i]`,
# return `nil`.
#
# Difficulty: 2/5
#
# store distance from i as dist
# to start, dist = arr.length
# store winner_pos
# if arr[y] > arr[i] && (i - y).abs < dist, y = winne_pos

def nearest_larger(arr, i)
  dist = arr.length
  winner_pos = nil
  y = 0

  while y < arr.length
    
    if arr[y] > arr[i] && (i - y).abs < dist
      winner_pos = y
      dist = (i - y).abs
      y += 1
    else
      y += 1
    end
  end

  return winner_pos
end


puts nearest_larger([2,3,4,8], 2)
puts nearest_larger([2,8,4,3], 2)
puts nearest_larger([2,6,4,8], 2)
puts nearest_larger([2, 6, 4, 8], 3)
puts nearest_larger([2, 6, 9, 4, 8], 3)

puts "            "

puts "3, 1, 1, nil, 3"


