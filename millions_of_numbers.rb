# Instructions
# You are given three arrays of equal size. Each array has 1 million RANDOM integer values.

# Assume that each array is already sorted in ascending order and that no individual array has any duplicate values.

# Your goal is to write a method/function that will return an array of any/all values which are present in all three arrays.

# Bonus: Once you’ve found a working solution, try to optimize to run in O(n) time and 1x space complexity.

# Small Scale Example Below

#     #Ruby
#     nums_1 = [1, 2, 4, 5, 8]
#     nums_2 = [2, 3, 5, 7, 9]
#     nums_3 = [1, 2, 5, 8, 9]
#     find_matches(nums_1, nums_2, nums_3)
#     => [2, 5]

#     #JavaScript
#     nums1 = [1, 2, 4, 5, 8]
#     nums2 = [2, 3, 5, 7, 9]
#     nums3 = [1, 2, 5, 8, 9]
#     findMatches(nums1, nums2, nums3)
#     => [2, 5]

# this is a very heavy solution, might not scale well to millions of numbers
def find_matches(array_1, array_2, array_3)
  combined_array = array_1 + array_2 + array_3
  tally = combined_array.tally
  matches = []
  tally.each_pair { |number, occurances| matches << number if occurances == 3 }
  p matches
end

# this is a lighter solution, but doesn't preserve the original arrays
def find_matches_refactor(array_1, array_2, array_3)
  matches = []

  until array_1.empty? || array_2.empty? || array_3.empty?
    if array_1[0] == array_2[0] && array_1[0] == array_3[0]
      matches << array_1[0]
      array_1.shift
      array_2.shift
      array_3.shift
    elsif array_1[0] < array_2[0]
      array_1.shift
    elsif array_2[0] < array_3[0]
      array_2.shift
    else
      array_3.shift
    end
  end

  p matches
end

nums_1 = [1, 2, 4, 5, 8]
nums_2 = [2, 3, 5, 7, 9]
nums_3 = [1, 2, 5, 8, 9]
# find_matches(nums_1, nums_2, nums_3)
# find_matches_refactor(nums_1, nums_2, nums_3)

### I used ChatgGOD for this
def generate_sorted_array(size)
  array = []
  current_value = 1

  size.times do
    current_value += rand(1..10)
    array << current_value
  end

  array
end

gen_array_1 = generate_sorted_array(10000000)
gen_array_2 = generate_sorted_array(10000000)
gen_array_3 = generate_sorted_array(10000000)

find_matches(gen_array_1, gen_array_2, gen_array_3)
find_matches_refactor(gen_array_1, gen_array_2, gen_array_3)

# stepped_nums_1 = []
# stepped_nums_2 = []
# stepped_nums_3 = []
# 0.step(10000000, 1) {|num| stepped_nums_1.append(num)}
# 0.step(10000000, 5) {|num| stepped_nums_2.append(num)}
# 0.step(10000000, 10) {|num| stepped_nums_3.append(num)}

# find_matches(stepped_nums_1, stepped_nums_2, stepped_nums_3)
# find_matches_refactor(stepped_nums_1, stepped_nums_2, stepped_nums_3)