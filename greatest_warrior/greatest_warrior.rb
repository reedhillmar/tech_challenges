class Warrior
  attr_reader :level, :experience, :rank, :achievements

  def initialize(level = 1, experience = 100)
    @level = level
    @experience = experience
    @rank = get_rank
    @achievements = []
  end

  def adjust_level(opponent_difference)
    if opponent_difference >= 1
      @experience += (20 * opponent_difference * opponent_difference)
    elsif opponent_difference == 0
      @experience += 10
    elsif opponent_difference == -1
      @experience += 5
    end

    @experience = 10000 if @experience > 10000

    @level = @experience / 100

    if @level > 100
      @level = 100
    end
  end

  def get_rank
    allowed_ranks = ["Pushover", "Novice", "Fighter", "Warrior", "Veteran", "Sage", "Elite", "Conqueror", "Champion", "Master", "Greatest"]
    rank_index = @level/10

    rank_index = 10 if rank_index > 10

    allowed_ranks[rank_index]
  end

  def battle(opponent_level)
    opponent_rank_index = opponent_level / 10
    rank_index = @level / 10
    opponent_difference = opponent_level - @level

    # can they battle
    return "Invalid level" unless 1 <= opponent_level && opponent_level <= 100

    if opponent_rank_index > rank_index
      return "You've been defeated" unless opponent_difference < 5
    end

    battle_difficulty = String.new

    if opponent_difference <= -2
      battle_difficulty = "Easy fight"
    elsif opponent_difference <= 0
      battle_difficulty = "A good fight"
    else
      battle_difficulty = "An intense fight"
    end

    # adjust level
    adjust_level(opponent_difference)

    # adjust rank
    @rank = get_rank

    battle_difficulty
  end

  def training(scenario)
    description = scenario[0]
    experience_to_gain = scenario[1]
    level_requirement = scenario[2]

    if @level >= level_requirement
      @experience += experience_to_gain
      @experience = 10000 if @experience > 10000
      @level = @experience / 100
      @rank = get_rank
      @achievements << description
      return description
    else
      return "Not strong enough"
    end
  end
end