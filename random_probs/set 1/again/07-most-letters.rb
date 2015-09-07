# Write a method that takes a string in and returns true if the letter
# "z" appears within three letters **after** an "a". You may assume
# that the string contains only lowercase letters.
#
# Difficulty: medium.

#search for the "a" if you find an a, have true conditions if next three spots in array have z. otherwise move on to next a,
# done going through string. then print false.

def nearby_az(string)
	winner = []
	string.to_s.scan(/a\w\wz|a\wz|az/) { |az| winner.push(az)}

 if winner == []
		return false
	end
	return true
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts(nearby_az("abczabc"))

puts('nearby_az("baz") == true: ' + (nearby_az('baz') == true).to_s)
puts('nearby_az("abz") == true: ' + (nearby_az('abz') == true).to_s)
puts('nearby_az("abcz") == true: ' + (nearby_az('abcz') == true).to_s)
puts('nearby_az("a") == false: ' + (nearby_az('a') == false).to_s)
puts('nearby_az("z") == false: ' + (nearby_az('z') == false).to_s)
puts('nearby_az("za") == false: ' + (nearby_az('za') == false).to_s)