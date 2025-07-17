# Move the first letter of each word to the end of it, then add "ay" to the end of the word. Leave punctuation marks untouched.

def pig_it(text)
  pig_latin_array = []
  
  text.split.each do |word|
    if !word.match(/[[:punct:]]/)
      pig_latin_array << word[1..-1] + word[0] + "ay"
    else
      pig_latin_array << word
    end
  end
  
  pig_latin_array.join(' ')
end

pig_it("Hello world !")