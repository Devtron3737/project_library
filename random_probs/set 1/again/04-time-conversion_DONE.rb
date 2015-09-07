# Write a method that will take in a number of minutes, and returns a
# string that formats the number into `hours:minutes`.
#
# Difficulty: easy.
# hours_fin = minutes / 60
# minutes_fin = minutes % 60
# => if minutes_fin < 10
# 		minutes_fin = "0" + minutes_fin
# return "#{hours_fin}:#{minutes_fin}"

def time_conversion(minutes)
	hours_fin = minutes / 60
	minutes_fin = minutes % 60
		if minutes_fin < 10
			minutes_fin = "0#{minutes_fin}"
		end
	return "#{hours_fin}:#{minutes_fin}"

end




# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts('time_conversion(15) == "0:15": ' + (time_conversion(15) == '0:15').to_s)
puts('time_conversion(150) == "2:30": ' + (time_conversion(150) == '2:30').to_s)
puts('time_conversion(360) == "6:00": ' + (time_conversion(360) == '6:00').to_s)