class Sudoku
  attr_reader :data, :valid_set

  def initialize(data)
    @data = data
    @n = data.count
    @valid_set = determine_valid_set
  end

  def valid?
    valid_dimensions? && valid_rows? && valid_columns? && valid_boxes?
  end

  def determine_valid_set
    set = []

    (1..@n).each {|n| set << n}

    set
  end

  def valid_dimensions?
    @n > 0 &&
    (@n == 1 || @n == @data[1].count) &&
    Math.sqrt(@n) == Math.sqrt(@n).to_i.to_f
  end

  def valid_rows?
    @data.each do |row|
      return false if row.sort != @valid_set
    end

    true
  end

  def valid_columns?
    @data.transpose.each do |column|
      return false if column.sort != @valid_set
    end

    true
  end

  def valid_boxes?
    box_count = Math.sqrt(@n).to_i
    boxes = Hash.new { |h, k| h[k] = [] }
    slice_count = 0
    iterations = 0

    @data.each_slice(box_count) do |rows|
      rows.flatten.each_slice(box_count) do |slice|
        slice_count += 1
        boxes["Box #{slice_count}"] << slice
        if slice_count == box_count
          slice_count = 0
          iterations += 1
        end

        if iterations == box_count
          return false if boxes.any? do |box|
            box[1..-1].flatten.sort != @valid_set
          end

          (1..iterations).each do |count|
            boxes["Box #{count}"].clear
          end

          iterations = 0
        end
      end
    end

    true
  end
end

# Valid Sudoku
goodSudoku1 = Sudoku.new([
  [7,8,4, 1,5,9, 3,2,6],
  [5,3,9, 6,7,2, 8,4,1],
  [6,1,2, 4,3,8, 7,5,9],

  [9,2,8, 7,1,5, 4,6,3],
  [3,5,7, 8,4,6, 1,9,2],
  [4,6,1, 9,2,3, 5,8,7],
  
  [8,7,6, 3,9,4, 2,1,5],
  [2,4,3, 5,6,1, 9,7,8],
  [1,9,5, 2,8,7, 6,3,4]
])

goodSudoku2 = Sudoku.new([
  [1,4, 2,3],
  [3,2, 4,1],

  [4,1, 3,2],
  [2,3, 1,4]
])

# Invalid Sudoku
badSudoku1 = Sudoku.new([
  [0,2,3, 4,5,6, 7,8,9],
  [1,2,3, 4,5,6, 7,8,9],
  [1,2,3, 4,5,6, 7,8,9],
  
  [1,2,3, 4,5,6, 7,8,9],
  [1,2,3, 4,5,6, 7,8,9],
  [1,2,3, 4,5,6, 7,8,9],
  
  [1,2,3, 4,5,6, 7,8,9],
  [1,2,3, 4,5,6, 7,8,9],
  [1,2,3, 4,5,6, 7,8,9]
])

badSudoku2 = Sudoku.new([
  [1,2,3,4,5],
  [1,2,3,4],
  [1,2,3,4],  
  [1]
])

p goodSudoku1.valid?