# https://www.codewars.com/kata/555b1890a75b930e63000023/train/ruby

# Jon and Joe have received equal marks in the school examination. But, they won't reconcile in peace when equated with each other. To prove his might, Jon challenges Joe to write a program to find all possible number combos that sum to a given number. While unsure whether he would be able to accomplish this feat or not, Joe accpets the challenge. Being Joe's friend, your task is to help him out.

# Task
# Create a function combos, that accepts a single positive integer num (30 > num > 0) and returns an array of arrays of positive integers that sum to num.

# Notes
# Sub-arrays may or may not have their elements sorted.
# The order of sub-arrays inside the main array does not matter.
# For an optimal solution, the following operation should complete within 6000ms.

def combos(n, max = n)
  return [[]] if n == 0

  (1..[n, max].min).flat_map do |i|
    combos(n - i, i).map { |sub| [i] + sub }.sort
  end.map { |array| array.sort }
end

# p combos(1)
# p combos(2)
# p combos(3)
p combos(4)