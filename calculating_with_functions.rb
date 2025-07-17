def zero(function = nil)
  function ? function.call(0) : 0
end

def one(function = nil)
  function ? function.call(1) : 1
end

def two(function = nil)
  function ? function.call(2) : 2
end

def three(function = nil)
  function ? function.call(3) : 3
end

def four(function = nil)
  function ? function.call(4) : 4
end

def five(function = nil)
  function ? function.call(5) : 5
end

def six(function = nil)
  function ? function.call(6) : 6
end

def seven(function = nil)
  function ? function.call(7) : 7
end

def eight(function = nil)
  function ? function.call(8) : 8
end

def nine(function = nil)
  function ? function.call(9) : 9
end

def plus(x)
  ->(y) {y+x}
end

def minus(x)
  ->(y) {y-x}
end

def times(x)
  ->(y) {y*x}
end

def divided_by(x)
  ->(y) {y/x}
end