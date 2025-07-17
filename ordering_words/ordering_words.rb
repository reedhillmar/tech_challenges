def order(words)
  word_array = words.split

  word_array.sort_by! {|word| word.gsub(/\D/, "").to_i}

  word_array.join(" ")
end