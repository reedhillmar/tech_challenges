# Today we're going to be implementing a variation on the classic card game War!
# Here are the rules:
#
# A game of war is played by multiple players with 52 cards, numbered 1 to 52.
# The cards are randomly distributed to all players as fairly as possible.
# Then, each player turns over their top card.  Whoever reveals the highest value
# card claims the pile of revealed cards.  The prior two steps are repeated until
# one player has all of the cards and is pronounced winner.

deck = Array.new
(1..52).each {|card| deck << card}

def play_war(number_of_players, deck)
  player_hands = Hash.new

  n = 1

  until number_of_players == 0
    player_hands["Player #{n}"] = []

    n += 1
    number_of_players -= 1
  end

  cards_dealt = 0

  until cards_dealt >= deck.count
    player_hands.each_value do |value|
      value << deck[cards_dealt] unless deck[cards_dealt].nil?
      cards_dealt += 1
    end
  end

  until player_hands.any? {|player, hand| hand.count == deck.count}
    round_cards = []
    round_players = []

    player_hands.each do |player, hand|
      if hand.any?
        round_players << player
        round_cards << hand.shift
      end
    end

    max = round_cards.max

    winner_index = round_cards.index(max)
    winning_player = round_players[winner_index]

    player_hands[winning_player] << round_cards
    player_hands[winning_player].flatten!.shuffle!
  end

  winner = player_hands.select {|k, v| v.count == deck.count}

  p "The winner is #{winner.keys[0]}!"
end

play_war(8, deck.shuffle!)