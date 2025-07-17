# You will be given a string (x) featuring a cat 'C', a dog 'D' and a mouse 'm'. The rest of the string will be made up of '.'.

# You need to find out if the cat can catch the mouse from its current position. The cat can jump at most (j) characters, and cannot jump over the dog.

# So:

# if j = 5:

# ..C.....m...D returns 'Caught!' <-- not more than j characters between the cat and the mouse

# .....C............m......D returns 'Escaped!' <-- as there are more than j characters between the two, the cat cannot jump far enough

# if j = 10:

# ...m.........C...D returns 'Caught!' <-- Cat can jump far enough and jump is not over dog

# ...m....D....C....... returns 'Protected!' <-- Cat can jump far enough, but dog is in the way, protecting the mouse

# Finally, if not all three animals are present, return 'boring without all three'

def cat_mouse(x,j)
  c = x.index('C')
  m = x.index('m')
  d = x.index('D')

  if c.nil? || m.nil? || d.nil?
    'boring without all three'
  elsif (c-m).abs > j
    'Escaped!'
  elsif (c < d && d < m) || (m < d && d < c)
    'Protected!'
  else
    'Caught!'
  end
end

cat_mouse('..D.....C.m', 2)