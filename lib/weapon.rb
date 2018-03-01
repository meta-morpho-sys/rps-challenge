# what is a weapon class? It has three types rock, paper and scissors.
# Rock beats Scissors
# Scissors beats Paper
# Paper beats Rock
#
class Weapon
  RULES = { rock: :scissors,
            scissors: :paper,
            paper: :rock }.freeze

  attr_reader :type

  def initialize(type)
    @type = type.to_sym
  end

  def beats?(other)
    if RULES[@type] == other.type
      :win
    elsif type == other.type
      :draw
    else
      :lose
    end
  end
end


