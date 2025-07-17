# Return the array of movements to execute to get out of the maze

class Player
  attr_accessor :y, :x, :direction, :solution, :visited, :last_forward_direction

  def initialize
    @y = nil
    @x = nil
    @direction = ""
    @last_forward_direction = ""
    @solution = []
    @visited = []
  end
end

def escape(maze, player = Player.new)

  return player.solution if player.y == 0 || player.x == 0 || player.y == (maze.length - 1) || player.x == (maze[1].length - 1)

  if player.y == nil || player.x == nil
    player.y = maze.index {|row| row if row.count("><v^") > 0}

    player.direction = maze[player.y].gsub("#", "").gsub(" ", "")
    player.last_forward_direction = player.direction

    player.x = maze[player.y].index(player.direction)

    player.visited << [player.y, player.x, player.direction]
  end

  if can_move_forward?(maze, player)
    move_forward(player)
    escape(maze, player)
  elsif can_turn_right?(maze, player)
    turn_right(player)

    if can_move_forward?(maze, player)
      return escape(maze, player)
    end
    
    player.solution.pop
    escape(maze, player)
  elsif can_turn_left?(maze, player)
    turn_left(player)

    if can_move_forward?(maze, player)
      return escape(maze, player)
    end
    
    player.solution.pop
    escape(maze, player)
  elsif can_turn_around?(maze, player)
    turn_around(player)

    if can_move_forward?(maze, player)
      return escape(maze, player)
    end
    
    player.solution.pop
    escape(maze, player)
  else
    reset_player_position(player)
    escape(maze, player)
  end
end

def can_move_forward?(maze, player)
  if player.direction == "^"
    return maze[player.y - 1][player.x] == " " && !player.visited.include?([player.y - 1, player.x, player.direction])
  elsif player.direction == "v"
    return maze[player.y + 1][player.x] == " " && !player.visited.include?([player.y + 1, player.x, player.direction])
  elsif player.direction == "<"
    return maze[player.y][player.x - 1] == " " && !player.visited.include?([player.y, player.x - 1, player.direction])
  elsif player.direction == ">"
    return maze[player.y][player.x + 1] == " " && !player.visited.include?([player.y, player.x + 1, player.direction])
  else
    return false
  end
end

def can_turn_right?(maze, player)
  if player.last_forward_direction == "^"
    return !player.visited.include?([player.y, player.x, ">"])
  elsif player.last_forward_direction == "v"
    return !player.visited.include?([player.y, player.x, "<"])
  elsif player.last_forward_direction == "<"
    return !player.visited.include?([player.y, player.x, "^"])
  elsif player.last_forward_direction == ">"
    return !player.visited.include?([player.y, player.x, "v"])
  end
end

def can_turn_left?(maze, player)
  if player.last_forward_direction == "^"
    return !player.visited.include?([player.y, player.x, "<"])
  elsif player.last_forward_direction == "v"
    return !player.visited.include?([player.y, player.x, ">"])
  elsif player.last_forward_direction == "<"
    return !player.visited.include?([player.y, player.x, "v"])
  elsif player.last_forward_direction == ">"
    return !player.visited.include?([player.y, player.x, "^"])
  end
end

def can_turn_around?(maze, player)
  if player.last_forward_direction == "^"
    return !player.visited.include?([player.y, player.x, "v"])
  elsif player.last_forward_direction == "v"
    return !player.visited.include?([player.y, player.x, "^"])
  elsif player.last_forward_direction == "<"
    return !player.visited.include?([player.y, player.x, ">"])
  elsif player.last_forward_direction == ">"
    return !player.visited.include?([player.y, player.x, "<"])
  end
end

def move_forward(player)
  player.solution << "F"
  player.last_forward_direction = player.direction

  if player.direction == "^"
    player.y -= 1
  elsif player.direction == "v"
    player.y += 1
  elsif player.direction == "<"
    player.x -= 1
  elsif player.direction == ">"
    player.x += 1
  end 

  player.visited << [player.y, player.x, player.direction]
end

def turn_right(player)
  player.solution << "R"

  if player.last_forward_direction == "^"
    player.direction = ">"
  elsif player.last_forward_direction == "v"
    player.direction = "<"
  elsif player.last_forward_direction == "<"
    player.direction = "^"
  elsif player.last_forward_direction == ">"
    player.direction = "v"
  end

  player.visited << [player.y, player.x, player.direction]
end

def turn_left(player)
  player.solution << "L"

  if player.last_forward_direction == "^"
    player.direction = "<"
  elsif player.last_forward_direction == "v"
    player.direction = ">"
  elsif player.last_forward_direction == "<"
    player.direction = "v"
  elsif player.last_forward_direction == ">"
    player.direction = "^"
  end

  player.visited << [player.y, player.x, player.direction]
end

def turn_around(player)
  player.solution << "B"

  if player.last_forward_direction == "^"
    player.direction = "v"
  elsif player.last_forward_direction == "v"
    player.direction = "^"
  elsif player.last_forward_direction == "<"
    player.direction = ">"
  elsif player.last_forward_direction == ">"
    player.direction = "<"
  end

  player.visited << [player.y, player.x, player.direction]
end

def reset_player_position(player)
  player.direction = player.last_forward_direction

  if player.direction == "^"
    player.y += 1
  elsif player.direction == "v"
    player.y -= 1
  elsif player.direction == "<"
    player.x += 1
  elsif player.direction == ">"
    player.x -= 1
  end
end

basic_mazes = []

basic_mazes << [
  '# #',
  ' > ',
  '# #'
]
basic_mazes << [
  '##########',
  '#>       #',
  '######## #'
]
basic_mazes << [
  '# ########',
  '#       >#',
  '##########'
]
basic_mazes << [
  '####### #',
  '#>#   # #',
  '#   #   #',
  '#########'
]
basic_mazes << [
  '##########',
  '#        #',
  '#  ##### #',
  '#  #   # #',
  '#  #^# # #',
  '#  ### # #',
  '#      # #',
  '######## #'
]
basic_mazes << [
  "#########################################",
  "#<    #       #     #         # #   #   #",
  "##### # ##### # ### # # ##### # # # ### #",
  "# #   #   #   #   #   # #     #   #   # #",
  "# # # ### # ########### # ####### # # # #",
  "#   #   # # #       #   # #   #   # #   #",
  "####### # # # ##### # ### # # # #########",
  "#   #     # #     # #   #   # # #       #",
  "# # ####### ### ### ##### ### # ####### #",
  "# #             #   #     #   #   #   # #",
  "# ############### ### ##### ##### # # # #",
  "#               #     #   #   #   # #   #",
  "##### ####### # ######### # # # ### #####",
  "#   # #   #   # #         # # # #       #",
  "# # # # # # ### # # ####### # # ### ### #",
  "# # #   # # #     #   #     # #     #   #",
  "# # ##### # # ####### # ##### ####### # #",
  "# #     # # # #   # # #     # #       # #",
  "# ##### ### # ### # # ##### # # ### ### #",
  "#     #     #     #   #     #   #   #    ",
  "#########################################"
]

basic_mazes.each {|maze| p escape(maze)}