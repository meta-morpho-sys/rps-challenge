require 'player'

describe Player do
  subject(:player1) { Player.new :'Genghis Khan' }
  subject(:player2) { Player.new 'Computer' }
  subject(:player3) { Player.new '' }

  it 'has name' do
    expect(player1.name).to eq :'Genghis Khan'
  end

  example 'becomes a Computer if no name is chosen' do
    expect(player3.name).to eq 'Computer'
  end

  it 'knows it is a Computer' do
    expect(player2.a_computer?).to eq true
  end

  describe 'gets weapons' do
    example 'actively, when it is a user' do
      player1.weapon = 'rock'
      expect(player1.weapon).to eq 'rock'
    end

    example 'randomly, when it is a Computer' do
      allow_any_instance_of(Array).to receive(:sample).and_return 'paper'
      player1.weapon = Weapon.random
      expect(player1.weapon).to eq 'paper'
    end
  end

  describe 'points' do
    example 'starting points' do
      expect(player1.points).to eq Player::DEFAULT_POINTS
    end

    it '#gain_points' do
      player1.update(10)
      expect(player1.points).to eq 10
    end
  end
end
