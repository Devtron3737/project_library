
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

def nearest_larger(arr, i)

  diff = 1
 
  done = false
    until done
    done = true
    left = i - diff
    right = i + diff
      if left >= 0 && arr[left] > arr[i]
        return left
      elsif right < arr.length && arr[right] > arr[i]
        return right
      elsif left < 0 && right > arr.length - 1
        return "nil"
      else diff += 1
        done = false
      end
    end
end


  
puts nearest_larger([2,3,4,8], 2)
puts 3
puts
puts nearest_larger([2,8,4,3], 2)
puts 1
puts
puts nearest_larger([2,6,4,8], 2)
puts 1
puts
puts nearest_larger([2, 6, 4, 8], 3)
puts "nil"
puts
puts nearest_larger([2, 6, 9, 4, 8], 3)
puts 2


