# Today we're going to be implementing a variation on the classic card game War!
# Here are the rules:
#
# A game of war is played by multiple players with 52 cards, numbered 1 to 52.
# The cards are randomly distributed to all players as fairly as possible.
# Then, each player turns over their top card.  Whoever reveals the highest value
# card claims the pile of revealed cards.  The prior two steps are repeated until
# one player has all of the cards and is pronounced winner.

#Pseudocode
#
# Stage 1 - 2 players
  # scenarios
    # player1
    # player2

    # p1 card > p2 card
      # p1 takes pile

    # p2 card > p1 card
      # p1 takes pile

    # p1 card == p2 card
      # start over

  # reveal starting deck and winner

  # game class
    # run the game
    # keep track of players
    # keep track of turns
    # keep track of revealed cards
      # could do direct comparison and not store revealed cards
      # with standard deck, option for ties, would need to store revealed cards
    # keep track starting deck

  # player class
    # keep track of player identity
    # keep track of player's hand


class Player
  attr_reader :name, :hand

  def initialize(name)
    @name = name
    @hand = []
  end
end

class Game
  attr_reader :player1, :player2, :deck

  def initialize(card_count, player_count)
    @players = create_players(player_count)
    @deck = build_deck(card_count)
  end

  def build_deck(card_count)
    (1..card_count).to_a.shuffle
  end

  def create_players(player_count)
    (1..player_count).map do |player_number|
      Player.new("Player #{player_number}")
    end
  end

  def deal
    even_multiple, remainder = @deck.length.divmod(@players.length)
    @players.shuffle.each_with_index do |player, player_index|
      card_start = player_index * even_multiple
      card_end = (player_index+1) * even_multiple

      player.hand += @deck[card_start...card_end]
      if player_index < remainder
        extra_card_offset = -1 - player_index
        player.hand.push(@deck[extra_card_offset])
      end
    end
  end

  def turn
    round_cards = []
    @players.each do |player|
      round_cards << (player.hand.shift || -1)
    end

    high_card = round_cards.max
    high_card_index = round_cards.index(high_card)
    @players[high_card_index].hand += round_cards.reject { |card| card == -1 }

    return @players[high_card_index]

  end

  def play_game
    loop do
      turn_winner = self.turn
      puts "#{turn_winner.name} wins hand"
      if turn_winner.hand.length == @deck.length
        puts "#{turn_winner.name} wins game"
        break
      end
    end
  end
end

game = Game.new(52, 2)
game.deal
