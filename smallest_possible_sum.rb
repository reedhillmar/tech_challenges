# return smallest possible sum of all numbers in Array
def solution(numbers)
  until numbers.uniq.length == 1
    numbers.sort!

    numbers[-1] = numbers.uniq[-1] - numbers.uniq[-2]
  end

  numbers.sum
end