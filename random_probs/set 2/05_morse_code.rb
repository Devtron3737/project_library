

# Build a function, `morse_encode(str)` that takes in a string (no
# numbers or punctuation) and outputs the morse code for it. See
# http://en.wikipedia.org/wiki/Morse_code. Put two spaces between
# words and one space between letters.
#
# You'll have to type in morse code: I'd use a hash to map letters to
# codes. Don't worry about numbers.
#
# I wrote a helper method `morse_encode_word(word)` that handled a
# single word.
#
# Difficulty: 2/5

Morse_code = {
  "a" => ".-",
  "b" => "-...",
  "c" => "-.-.",
  "d" => "-..",
  "e" => ".",
  "f" => "..-.",
  "g" => "--.",
  "h" => "....",
  "i" => "..",
  "j" => ".---",
  "k" => "-.-",
  "l" => ".-..",
  "m" => "--",
  "n" => "-.",
  "o" => "---",
  "p" => ".--.",
  "q" => "--.-",
  "r" => ".-.",
  "s" => "...",
  "t" => "-",
  "u" => "..-",
  "v" => "...-",
  "w" => ".--",
  "x" => "-..-",
  "y" => "-.--",
  "z" => "--.."}

def morse_encode(str)
result = []
str.split(" ").collect do |word| result.push("#{morsify(word)}" + " ") end

  result.join("")
end

def morsify(wrd)
  

  mors = []

  wrd.each_char do |letter| mors.push(Morse_code["#{letter}"] + " ") end
    return mors.join("")
  end


  puts morse_encode("q")
  puts  "--.-"

puts   morse_encode("cat in hat")

puts "-.-. .- -  .. -.  .... .- -"