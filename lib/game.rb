# require_relative 'player'

# Exercises the logic of the game
class Game
  attr_reader :players, :result

  def self.start(player1_name, player2_name)
    player1 = Player.new player1_name
    player2 = Player.new player2_name
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

  def game_over?
    losing_players.any?
  end

  private

  def losing_players
    @players.select { |player| player.points >= 30 }
  end
end
