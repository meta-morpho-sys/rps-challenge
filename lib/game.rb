# Exercises the logic of the game
class Game
  attr_reader :players

  def initialize(player1, player2)
    @players = [player1, player2]
  end
end
