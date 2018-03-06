require_relative 'weapon'

# represents the player
class Player
  attr_reader :name, :weapon

  def initialize(name)
    @name = name
    @name = 'Computer' if name == ''
    @weapons = Weapon::ARSENAL
  end

  def a_computer?
    # @name ||= 'Computer'
    @name == 'Computer'
    # @name = 'Computer' if @name == ''
  end

  def choose_weapon(type)
    @weapon = Weapon.new(type)
  end

  def choose_random_weapon
    sample_weapon = @weapons.sample
    @weapon = Weapon.new(sample_weapon)
  end
end
