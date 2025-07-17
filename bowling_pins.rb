def bowling_pins(arr)
  pins = "I I I I\n I I I \n  I I  \n   I   "

  arr.each do |pin|
    if pin > 6
      position_in_row = pin - 6
      pin_index = (2 * position_in_row) - 2
    elsif pin > 3
      position_in_row = pin - 3
      pin_index = (2 * position_in_row) + 7
    elsif pin > 1
      position_in_row = pin - 1
      pin_index = (2 * position_in_row) + 16
    else
      pin_index = 27
    end

    pins[pin_index] = " "
  end

  pins
end

p bowling_pins([3, 5, 9])