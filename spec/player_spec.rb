require 'player'

describe Player do
  subject(:player) { Player.new :'Genghis Khan' }
  let(:player2) { Player.new 'Computer' }

  it 'has name' do
    expect(subject.name).to eq :'Genghis Khan'
  end

  it 'knows it is a computer' do
    expect(player2.a_computer?).to eq true
  end

  it 'chooses his weapon' do
    player.choose_weapon 'rock'
    expect(player.weapon).to be_an_instance_of Weapon
  end
end
