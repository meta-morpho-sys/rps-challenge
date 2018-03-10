require 'ruby-enum'
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
      1
    elsif weapon == other_weapon
      0
    else
      -1
    end
  end
end
