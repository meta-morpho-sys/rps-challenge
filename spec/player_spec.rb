require 'player'

describe Player do
  subject(:player1) { Player.new :'Genghis Khan' }
  subject(:player2) { Player.new 'Computer' }
  subject(:player3) { Player.new '' }

  it 'has name' do
    expect(player1.name).to eq :'Genghis Khan'
  end

  example 'the name is set to Computer if no name is chosen' do
    expect(player3.name).to eq 'Computer'
  end

  it 'knows it is a computer' do
    expect(player2.a_computer?).to eq true
  end

  describe 'has choice of weapons' do
    example 'actively' do
      player1.weapon = 'rock'
      expect(player1.weapon).to eq 'rock'
    end

    example 'randomly' do
      allow_any_instance_of(Array).to receive(:sample).and_return 'paper'
      player1.weapon = Weapon.random
      expect(player1.weapon).to eq 'paper'
    end
  end
end
