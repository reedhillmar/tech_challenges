def calculate(str)
  str.gsub!('plus', '+')
  
  str.gsub!('minus', '-')
  
  sum = 0
  next_int = ""
  operator = "+"
  
  until str.empty?
    if str[0].to_i.to_s == str[0]
      next_int.concat(str[0])
    elsif str[0] == "+"
      sum = operate(sum, operator, next_int.to_i)
      operator = "+"
      next_int = ""
    elsif str[0] == "-"
      sum = operate(sum, operator, next_int.to_i)
      operator = "-"
      next_int = ""
    end
    
    str = str[1..-1]
  end
  
  sum = operate(sum, operator, next_int.to_i)
  
  sum.to_s
end

def operate(sum, operator, next_int)
  if operator == '+'
    sum += next_int
  elsif operator == '-'
    sum -= next_int
  end
end