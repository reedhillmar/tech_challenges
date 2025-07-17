# Write an algorithm that takes an array and moves all of the zeros to the end, preserving the order of the other elements.

# def moveZeros(arr)
#   index = 0
#   arr.each do |num|
#     if num.zero?
#       arr.slice!(index)
#       arr << 0
#     end
#     index += 1
#   end
#   arr
# end

# def moveZeros(arr)
#   arr.each_index {|index| arr << arr.slice!(index).to_i if arr[index] == 0}
# end

def moveZeros(arr)
  zeros = arr.select {|num| num == 0}
  non_zeros = arr.select {|num| num != 0}
  non_zeros + zeros
end