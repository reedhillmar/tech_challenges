# This time no story, no theory. The examples below show you how to write function accum:

# Examples:
# accum("abcd") -> "A-Bb-Ccc-Dddd"
# accum("RqaEzty") -> "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
# accum("cwAt") -> "C-Ww-Aaa-Tttt"
# The parameter of accum is a string which includes only letters from a..z and A..Z.

def accum(s)
	solution = ""
	n = 0
	s.each_char do |char|
		solution += char.upcase
		n.times do
			solution += char.downcase
		end

		n += 1

		unless n == s.length
			solution += "-"
		end
	end

	solution
end

p accum("abcd")