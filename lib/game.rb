# require_relative 'player'

# Exercises the logic of the game
class Game
  attr_reader :players, :result

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

  def throw
    @result = Weapon.compare(player1.weapon, player2.weapon)
  end
end
