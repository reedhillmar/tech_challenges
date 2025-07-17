# In this challenge, you are working with a computer simulation of a mobile robot. The robot moves on a plane, and its movements are described by a command string consisting of one or more of the following letters:

# G instructs the robot to move forward one step
# L instructs the robot to turn left
# R instructs the robot to turn right
# The robot CANNOT go backwards - poor robot. After running all of the movement commands, you want to know if the robot returns to its original starting location.

#     #Ruby
#     return_to_origin?("GRGRGRG")
#     => true

#     JavaScript
#     returnToOrigin("GRGL")
#     => false

### Clarifying questions
  # Can only valid instructions be given?
    # Assumption: Yes
  
  # Is starting location orientation specific? If on the same square, but facing different direction, does that count?
    # Assumption: Yes

### Pseudocode

  # Imagine the robot is on a tiled grid system, at the origin (0,0) facing up
  # If robot moves forward, location becomes (0,1)
  # If robot moves to the right, location becomes (1,0)
  # If robot moves to the left, location becomes (-1,0)

  # I want to keep track of robot location and orientation
  # R/L will change oriention
  # G will change location

  # When all commands have been given, is robot at (0,0)

def return_to_origin?(string_command)
  grid_x = 0
  grid_y = 0
  orientation = 0
  # orientations
    # 0 = up
    # 1 = right
    # 2 = down
    # 3 = left

  until string_command.empty?
    command = string_command.slice!(0)

    if command == 'R'
      orientation += 1
      if orientation == 4
        orientation = 0
      end
    elsif command == 'L'
      orientation -= 1
      if orientation.negative?
        orientation = 3
      end
    elsif command == 'G'
      if orientation == 0
        grid_y += 1
      elsif orientation == 1
        grid_x += 1
      elsif orientation == 2
        grid_y -= 1
      else
        grid_x -= 1
      end
    # else conditions for invalid arguments if needed could go here
    end
  end

  p grid_x == 0 && grid_y == 0 # && orientation == 0 (if solution needs to be orientation specific)
end

return_to_origin?("GRGRGRG")
return_to_origin?("GRGL")