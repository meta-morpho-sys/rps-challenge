require_relative 'weapon'

# represents the player and tracks points
class Player
  DEFAULT_POINTS = 0

  attr_reader :name, :points
  attr_accessor :weapon

  def initialize(name, initial_points = DEFAULT_POINTS)
    @name = name
    @name = 'Computer' if name == ''
    @points = initial_points
  end

  def a_computer?
    @name == 'Computer'
  end

  def gain(points)
    @points += points
  end
end
