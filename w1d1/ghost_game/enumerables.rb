class Array
  def my_select(&prc)
    matches = []
    self.each do |value|
      if prc.call(value)
      matches << value
      end
    end
  matches
  end

  def my_reject(&prc)
    matches = []
    self.each do |value|
      unless prc.call(value)
      matches << value
      end
    end
  matches
  end

  def my_any?(&prc)
    matches = []
    self.each do |value|
      if prc.call(value)
        matches << value
      end
    end
    !matches.empty?
  end

  def my_all?(&prc)
    matches = []
    self.each do |value|
      if prc.call(value)
        matches << value
      else
        return false
      end
    end
    !matches.empty?
  end

  # [[1],[[2]]
  def my_flatten
    result = []
    self.each do |el|
      if el.class == Array # && el.length == 1
        # result << el[0]
      # elsif el.class == Array
        temp = el.my_flatten # [1]
        result += temp #[1,2]
      else
        result << el
      end
    end
    result
  end

  def my_zip(*arr)
    result = []
    self.each_with_index do |value, index|
      temp = [self[index]]
      arr.each { |value| temp << value[index]}
      result << temp
    end
    result
  end

  def my_rotate(num = 1)
    temp = self
    if num > 0
      num.times { temp.push(temp.shift) }
    else
      (num*(-1)).times { temp.unshift(temp.pop) }
    end
    temp
  end

  def my_join(separator = "")
    result = ""
    self.each { |char| result = result + separator + char}
    result
  end
end
