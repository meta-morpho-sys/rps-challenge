require_relative 'weapon'

# represents the player
class Player
  attr_reader :name, :weapon

  def initialize(name)
    @name = name
  end

  def choose_weapon(type)
    @weapon = Weapon.new(type)
  end

  def a_computer?
    @name == 'Computer'
  end

  def choose_random_weapon
    randomise_weapon_type
  end

  def randomise_weapon_type
    %i[rock paper scissors].sample
  end
end
