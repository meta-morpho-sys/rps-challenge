# what is a weapon class? It has three types rock, paper and scissors.
# Rock beats Scissors
# Scissors beats Paper
# Paper beats Rock
#
class Weapon
  ARSENAL = %i[rock paper scissors]
  RULES = { rock: :scissors,
            scissors: :paper,
            paper: :rock }.freeze

  attr_reader :type

  def initialize(type)
    @type = type.to_sym
  end

  def beats?(other)
    if RULES[type] == other.type
      1
    elsif type == other.type
      0
    else
      -1
    end
  end
end
