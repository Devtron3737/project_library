MORSE_CODE = {
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
  "z" => "--.."
}

def morse_encode(str)
  words = str.split(" ")
  encoded_words = words.map { |word| morse_encode_word(word) }
  encoded_words.join("  ")
end

def morse_encode_word(word)
  letters = word.split("")
  codes = letters.map { |l| MORSE_CODE[l] }
  codes.join(" ")
end

puts morse_encode("q")
  puts  "--.-"

puts   morse_encode("cat in hat")

puts "-.-. .- -  .. -.  .... .- -"