def range(start, final)
  return [] if final < start
    if start == final
      return [final]
    else
      range_array = range(start, final-1)
      range_array << final
    end
end

def sum_iterative(arr)
  arr.inject(&:+)
end

def sum_recursive(arr)
  return 0 if arr.empty?
  if arr.length == 1
    return arr.pop
  else
    arr.pop + sum_recursive(arr)
  end
end

def exp_1(num,pow)
  if pow == 0
    return 1
  else
    num*exp_1(num,pow-1)
  end
end

def exp_2(num,pow)
  if pow == 0
    return 1
  elsif pow == 1
    return num
  else
    if(pow.even?)
      exp_2(num,pow/2) **2
    else
      num * exp_2(num,(pow-1)/2)**2
    end
  end
end

def deep_dup(arr)
  copy = []
  arr.length.times do |num|
    if arr[num].is_a?(Fixnum)
      copy[num] = arr[num]
    else
      copy[num] = deep_dup(arr[num])
    end
  end
  copy
end



def fib_it(n)
  result = [0,1]
  if n == 0
    return []
  elsif n == 1
    return result[0]
  elsif n == 2
    return result
  end
  # count = 3
  (n-2).times { result.push(result[-1] + result[-2]) }
  result
end

def fib_rec(n)
  if n == 1
    return [0]
  elsif n == 2
    return [0,1]
  else
    result = fib_rec(n-1)
    result << (result[-1] + result[-2])
  end
end

def binary_search(arr, tar)
  if arr.length == 1
    if arr[0] == tar
      return 0
    else
      return nil
    end
  else
    mid = arr[arr.length/2]
    if( tar > mid)
      new_arr = arr[arr.length/2+1..-1]
      return binary_search(new_arr, tar) + arr.length/2+1
    elsif( tar < mid )
      new_arr = arr[0..arr.length/2-1]
      return binary_search(new_arr, tar)
    elsif( tar == mid)
      return arr.length/2
    end
  end
end

def make_change(tar, arr)
  if tar == 0
    return []
  elsif tar < 0
    return [-1]
  else
    min = 1.0/0.0
    coin_array = []
    arr.length.times do |coin|
      a = make_change(tar - arr[coin], arr)
      a << arr[coin]
      if a.length < min && a[0] != -1
        min = a.length
        coin_array = a.dup
      end
    end
  end
    return coin_array
end

# base cases will be empty array or array.length of 1. if its these cases, return self
# what we wanna do is continue to half the array until all arrays are length 1
# sorted_array_first
#sorted_array_second (variable that we push merge_sorted arrays into)
# so now want to create two pointers for each sorted array, in order to push
#smallest value into new array
# idx_first = 0
# idx_second = 0
# if sorted_array_first[idx_first] < sorted_array_second[idx_second]
#   push sorted_array_first[idx_first] into result_array
# idx_first += 1
#oppsite for second array
# if
#
#so you can recurse and call merge_sort
#
#

def merge_sort(arr)
  if arr.length == 1
    return arr
  elsif arr.empty?
    return arr
  else
    first_half = merge_sort(arr[0..arr.length/2-1])
    second_half = merge_sort(arr[arr.length/2..-1])
    sorted_array = []
    idx_first = 0
    idx_second = 0
    until idx_first == first_half.length || idx_second == second_half.length
      if first_half[idx_first] < second_half[idx_second]
        sorted_array << first_half[idx_first]
        idx_first += 1
      elsif first_half[idx_first] > second_half[idx_second]
        sorted_array << second_half[idx_second]
        idx_second += 1
      end
    end

    if idx_first == first_half.length
      sorted_array += second_half[idx_second..-1]
    else sorted_array += first_half[idx_first..-1]
    end
    return sorted_array
  end
end

def subset(arr)
  if arr.empty?
    return []
  elsif arr.length == 1
    return [arr]
  end
  subs = [arr]
  arr.length.times do |num|
    if num == 0
      a = subset(arr[1..-1])
    elsif num == arr.length
      a = subset(arr[0..arr.length-2])
    else
      a = subset(arr[0..num-1] + arr[num+1..-1])
    end
    subs += a.reject {|arr| subs.include?(arr)}
  end
  subs << [] unless subs.include?([])
  subs
end
