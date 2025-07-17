# you have a deck of cards
# before you play, you want to shuffle

# make my deck of cards
  # store as an array
    # 1..52
  # randomize deck before dealing

deck = []

(1..52).each {|card| deck << card}


def my_shuffle(deck, i)
  i.downto(0) do |move|
    r = Random.new
    # require 'pry';binding.pry
    deck.insert(r.rand(0..deck.count), deck.shift)
  end

  deck
end

# p my_shuffle(deck, 1000)

deck1 = [1, 2, 3, 4]
deck2 = [1, 2, 3, 4]

def compare(deck1, deck2, count = 0)
  1000.times do |x|
    my_shuffle(deck1, 1000)
    my_shuffle(deck2, 1000)

    if deck1 == deck2
      count += 1
    end
  end
  
  count
end

p compare(deck1, deck2)