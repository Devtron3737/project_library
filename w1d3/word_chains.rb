require 'Set'
class WordChainer
  attr_accessor :dictionary, :current_words, :all_seen_words
  def initialize(dictionary_file_name)
    @dictionary = Set.new
    f = File.open(dictionary_file_name)
    f.readlines.each do |line|
      @dictionary << line.chomp
    end
  end

  def adjacent_words(word)
    dictionary.select {|words| one_off?(word,words)}
  end

  def run(source, target)
    @current_words = [source]
    @all_seen_words = {source => nil}

    until @current_words.empty?
      current = @current_words.shift
      new_current_words = explore_current_words(current)
      new_current_words.map do |word|
        @all_seen_words[word] = current
      end

      @current_words += new_current_words
    end
    build_path(target)
  end
  private

  def build_path(target)
    path = [target]
    target_dup = target
    while @all_seen_words[target_dup] != nil
      path << @all_seen_words[target_dup]
      target_dup = @all_seen_words[target_dup]
    end
    path
  end

  def explore_current_words(word)
    adjacent_words(word).reject{|a| @all_seen_words.include?(a)}
  end

  def one_off?(word1,word2)
    return false if word1.length != word2.length
    count = 0
    word1.length.times do |letter|
      count += 1 unless word1[letter] == word2[letter]
    end
    if count == 1
      return true
    else false
    end
  end
end


a = WordChainer.new("dictionary.txt")

p a.run("market", "scales")
