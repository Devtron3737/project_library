def bubble_sort(arr)
  sorted = false
  until sorted == true  
    sorted = true
    (arr.count - 1).times do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        sorted = false
      end
    end
  end

  arr.inspect
end

puts bubble_sort([5, 4, 3, 2, 1])
puts [1, 2, 3, 4, 5]