def top_3_words(text)
  text.downcase!
  text.gsub!(/[^a-z' ]/, " ")
  
  return [] if text.empty?

  words = text.split.tally

  words.delete_if { |k, v| k.gsub("'", "").empty? }

  words = words.sort_by { |word, value| value }.reverse!
  
  p words.map {|word| word[0] }[0..2]
end

top_3_words("a a a  b  c c  d d d d  e e e e e")
top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")
top_3_words("  //wont won't won't ")
top_3_words("  , e   .. ")
top_3_words("  ...  ")
top_3_words("  '  ")
top_3_words("  '''  ")