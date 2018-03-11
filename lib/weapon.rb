require 'ruby-enum'

# represents possible outcomes when weapons and players with weapons are
# compared
class CompResult
  include Ruby::Enum

  define :BEATS, 1
  define :DRAW, 0
  define :LOSES, -1
end

# what is a weapon class? It has three types rock, paper and scissors.
# Rock beats Scissors
# Scissors beats Paper
# Paper beats Rock
#
class Weapon
  include Ruby::Enum

  define :ROCK, 'rock'
  define :PAPER, 'paper'
  define :SCISSORS, 'scissors'

  RULES = { rock: :scissors,
            scissors: :paper,
            paper: :rock }.freeze

  def self.compare(weapon, other_weapon)
    if RULES[weapon.to_sym] == other_weapon.to_sym
      CompResult::BEATS
    elsif weapon == other_weapon
      CompResult::DRAW
    else
      CompResult::LOSES
    end
  end

  def self.random
    values.sample
  end
end
