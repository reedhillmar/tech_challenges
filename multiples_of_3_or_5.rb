# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

# Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.

# Additionally, if the number is negative, return 0.

# Note: If the number is a multiple of both 3 and 5, only count it once.

# def solution(number)
#   all_multiples = []
#   multiples_of_3 = (number - 1)/3
#   multiples_of_5 = (number - 1)/5
  
#   if number <= 0
#     0
#   else
#     until multiples_of_3 == 0
#       all_multiples << (multiples_of_3 * 3)
#       multiples_of_3 -= 1
#     end

#     until multiples_of_5 == 0
#       all_multiples << (multiples_of_5 * 5) if !all_multiples.include?(multiples_of_5 * 5)
#       multiples_of_5 -= 1
#     end
    
#     all_multiples.sum
#   end
# end

# refactor
def solution(number)
  sum=0
  for x in 1...number
    sum+=x if (x % 3 == 0 || x % 5 == 0)
  end

  p sum
end

solution(10)