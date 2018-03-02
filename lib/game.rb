require_relative 'player'

# Exercises the logic of the game
class Game
  attr_reader :players

  def self.start(player1, player2)
    @game = Game.new(player1, player2)
  end

  def self.instance_access
    @game
  end

  def initialize(player1, player2)
    @players = [player1, player2]
  end

  def player1
    @players.first
  end

  def player2
    @players.last
  end

  # Returns weapon object
  def choose_weapon1(type)
    player1.choose_weapon(type)
  end

  # Returns weapon object
  def choose_weapon2(type)
    player2.choose_weapon(type)
  end

  def throw(weapon1, weapon2)
    weapon1 <=> weapon2
  end
end

