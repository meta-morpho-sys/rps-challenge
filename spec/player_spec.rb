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
    it 'Player chooses his weapon' do
      player1.choose_weapon 'rock'
      expect(player1.weapon).to be_an_instance_of Weapon
    end

    example '#choose_random_weapon' do
      allow_any_instance_of(Array).to receive(:sample).and_return :paper
      expect(player1.choose_random_weapon.type).to eq :paper
    end
  end
end
