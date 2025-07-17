class CustomArray
  attr_reader :array, :flattened_array

  def initialize(array)
    @array = array
    @flattened_array = []
  end

  def flatten
    return @flattened_array if @array.empty?

    first_element = @array.first

    if first_element.kind_of?(Array)
      if first_element.empty?
        @array.shift
      else
        @array.unshift(first_element.shift)
      end
    else
      @flattened_array << @array.shift
    end

    self.flatten
  end
end

c = CustomArray.new([[1,2],[3,[4,5]]])
p c.flatten