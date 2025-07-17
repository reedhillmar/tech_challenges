# straight flush - 9
# four of a kind - 8
# full house - 7
# flush - 6
# straight - 5
# three of a kind - 4
# two pairs - 3
# pair - 2
# high card - 1

class PokerHand
  attr_reader :hand, :flush, :straight, :full_house, :sets, :highest_set, :high_to_low, :score

  def initialize(hand)
    @hand = hand_to_hash(hand)
    @flush = flush?
    @straight = straight?
    @sets = get_sets
    @highest_set = @sets.max
    @high_to_low = sort_cards
    @score = determine_hand_score
  end

  def compare_with(other)
    if @score > other.score
      return "Win"
    elsif @score < other.score
      return "Loss"
    elsif @score == other.score
      @high_to_low.each_with_index do |card, index|
        if card > other.high_to_low[index]
          return "Win"
        elsif card < other.high_to_low[index]
          return "Loss"
        end
      end

      return "Tie"
    end
  end

  def hand_to_hash(hand)
    hand_hash = Hash.new(0)

    hand.gsub(" ", "").each_char do |c|
      if c == "T"
        c = "10"
      elsif c == "J"
        c = "11"
      elsif c == "Q"
        c = "12"
      elsif c == "K"
        c = "13"
      elsif c == "A"
        c = "14"
        hand_hash["1"] += 1
      end

      hand_hash[c] += 1
    end

    hand_hash
  end

  def flush?
    ["S", "H", "D", "C"].each do |suit|
      if @hand[suit] == 5
        return true
      end
    end

    false
  end

  def straight?
    in_a_row = 0

    (1..14).each do |rank|
      if @hand[rank.to_s] > 0
        in_a_row += 1

        return true if in_a_row == 5
      else
        in_a_row = 0
      end
    end

    false
  end

  def get_sets
    sets = []
    (2..14).each do |rank|
      sets << @hand[rank.to_s] if @hand[rank.to_s] > 0
    end

    sets
  end

  def sort_cards
    sorted_cards = []

    (1..14).each do |rank|
      @hand[rank.to_s].times do
        sorted_cards << rank
      end
    end

    sorted_cards.reverse
  end

  def determine_hand_score
    if @straight
      if @flush
        9
      else
        5
      end
    elsif @flush
      6
    elsif @highest_set == 4
      8
    elsif @highest_set == 3
      if @sets.include?(2)
        7
      else
        4
      end
    elsif @highest_set == 1
      1
    elsif @highest_set == 2
      if @sets.count == 3
        3
      else
        2
      end
    end
  end
end