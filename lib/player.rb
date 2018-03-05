require_relative 'weapon'

# represents the player
class Player
  attr_reader :name, :weapon

  def initialize(name)
    @name = name
  end

  def a_computer?
    @name == 'Computer'
  end

  def choose_weapon(type)
    @weapon = Weapon.new(type)
  end

  def choose_random_weapon
    sample_weapon = %i[rock paper scissors].sample
    @weapon = Weapon.new(sample_weapon)
  end
end
