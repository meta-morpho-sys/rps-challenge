require 'player'

describe Player do
  subject(:player) { Player.new :'Genghis Khan'}

  it 'has name' do
    expect(subject.name).to eq :'Genghis Khan'
  end

  it 'chooses his weapon' do
    player.choose_weapon 'rock'
    expect(player.weapon).to be_an_instance_of Weapon
  end
end
