require 'weapon'

# represents the player
class Player
  attr_reader :name, :weapon

  def initialize(name)
    @name = name
  end

  def choose_weapon(type)
    @weapon = Weapon.new(type)
  end
end
