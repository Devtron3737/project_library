class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash_val = 17
    # return hash_val if empty?
    each_with_index do |el, j|

      hash_val += (el.hash ^ (j+7))

    end
    hash_val
  end
end

class String
  def hash
    split("").map { |char| char.ord }.hash
  end

end

class Hash
  def hash
    hash_val = 0
    arr = to_a.sort
    arr.each_with_index do |pair, j|
      hash_comp = (pair.inject(0) { |sum, val| sum + val.hash}) ^ (j + 2)
      hash_val = hash_val ^ hash_comp
    end
    hash_val
  end
end
