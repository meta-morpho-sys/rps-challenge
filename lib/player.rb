require_relative 'weapon'

# represents the player
class Player
  attr_reader :name
  attr_accessor :weapon

  def initialize(name)
    @name = name
    @name = 'Computer' if name == ''
  end

  def a_computer?
    @name == 'Computer'
  end
end
