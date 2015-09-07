# Write a method, `ordered_vowel_words(str)` that takes a string of
# lowercase words and returns a string with just the words containing
# all their vowels (excluding "y") in alphabetical order. Vowels may
# be repeated (`"afoot"` is an ordered vowel word).
#
# You will probably want a helper method, `ordered_vowel_word?(word)`
# which returns true/false if a word's vowels are ordered.
#
# Difficulty: 2/5
# in_order = []
#
# str.split(" ").each do |word| in_order.push(word) if ordered_vowel_word?(word) == true
#end
# 

def ordered_vowels(str)
  in_order = []

  str.split(" ").each do |word| in_order.push(word) if ordered_vowel_word?(word) == true
  end
  return in_order.join(" ")
end

def ordered_vowel_word?(input)
  unsorted = []
  input.scan(/[aeiouAEIOU]/) {|vowel| unsorted.push(vowel)}

  return true if unsorted == unsorted.sort

end

puts ordered_vowels("amends")
puts ordered_vowels("complicated")
puts ordered_vowels("this is a test of the vowel ordering system")
puts "this is a test of the system"

 
