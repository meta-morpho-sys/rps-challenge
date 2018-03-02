require 'player'

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
  def weapon1
    player1.weapon
  end

  # Returns weapon object
  def weapon2
    player2.weapon
  end

  def result(weapon1, weapon2)
    weapon1.beats?(weapon2)
  end
end

