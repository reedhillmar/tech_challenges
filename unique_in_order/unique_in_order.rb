def unique_in_order(iterable)
  # iterable = iterable.split(//) if iterable.class == String

  # solution = []

  # iterable.each do |char|
  #   solution << char if char != solution.last
  # end

  # solution

  solution = []

  (0...iterable.length).each do |i|
    solution << iterable[i] if iterable[i] != solution.last
  end

  solution
end

p unique_in_order('AAAABBBCCDAABBB')
p unique_in_order('ABBCcAD')
p unique_in_order([1,2,2,3,3])