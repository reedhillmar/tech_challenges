# Instructions
# Given an n x n array, write a method that returns the array elements arranged from outermost elements to the middle element, traveling clockwise.

# A good way to visualize this is to picture the spiral shell of a snail!

# Example

#     #Ruby
#     array_matrix = [
#         [1, 2, 3],
#         [4, 5, 6],
#         [7, 8, 9]
#     ];
#     snail(array_matrix) 
#     => [1, 2, 3, 6, 9, 8, 7, 4, 5]


#     #JavaScript
#     const arrayMatrix = [
#         [9, 8, 7],
#         [6, 5, 4],
#         [3, 2, 1]
#     ];
#     snail(arrayMatrix) 
#     => [9, 8, 7, 4, 1, 2, 3, 6, 5]

def snail(array_matrix)
  solution = []

  until array_matrix.empty?
    solution << array_matrix.shift

    array_matrix.each do |array|
      solution << array.pop
    end if array_matrix.any?

    solution << array_matrix.pop.reverse if array_matrix.any?

    array_matrix.reverse.each do |array|
      solution << array.shift
    end if array_matrix.any?

    solution.flatten
  end

  p solution.flatten
end

array_matrix_n1 = [
  [1]
]

array_matrix_n2 = [
  [1, 2],
  [3, 4]
]

array_matrix_n3 = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

array_matrix_n4 = [
  [ 1,  2,  3,  4],
  [ 5,  6,  7,  8],
  [ 9, 10, 11, 12],
  [13, 14, 15, 16]
]

array_matrix_n5 = [
  [ 1, 2, 3, 4, 5],
  [ 6, 7, 8, 9,10],
  [11,12,13,14,15],
  [16,17,18,19,20],
  [21,22,23,24,25]
]

array_matrix_bitburner = [
  [ 5,49,36,31, 7,19,46,49,49,21,34,33,38,38,35],
  [28,20,36,21,34,35,42,45,30,39,31,46,18, 3,42],
  [38,42,25,30,22, 2,43,46,10,43,25,18,33,11, 6],
  [14,13,39,35,13,11,45,44,50,48,32,13, 5, 4,39],
  [27,19, 8,48,30,43,23, 7,17,21,26,46,11,19, 3],
  [29,27,44,26,43,40, 9,18,50,11,11,44, 7,39,18],
  [33,31,38, 3, 6,43,27,10,21,22,20,27,29,44,19],
  [ 3,45,11, 4,50,38,14,44,35,50,30,29,10,32,15],
  [23,41,16,19,40,20,19,33,16, 2,41,41,41,35,50],
  [34,36,48,19, 3,44, 1,41,37,25,32,45,48,37,41],
  [47, 6,32, 1,16,41, 5,41,21,34,42,12, 8,40,44],
  [45,23,27,50,50,21, 8,16, 3,28,14, 4,25,22,47],
  [ 4,37,34,23,48,27,20, 6,18,34,32, 2,17,27,46]
]

snail(array_matrix_n1)
snail(array_matrix_n2)
snail(array_matrix_n3)
snail(array_matrix_n4)
snail(array_matrix_n5)
snail(array_matrix_bitburner)
