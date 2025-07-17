def scramble(str1, str2)
  str1_letters = str1.chars.tally
  str2_letters = str2.chars.tally

  str2_letters.each do |letter, amount|
    return false unless str1_letters[letter] &.>= amount
  end

  true
end

p scramble('rkqodlw', 'world')