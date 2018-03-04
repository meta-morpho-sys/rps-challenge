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

  example '#randomise_weapon' do
    allow_any_instance_of(Array).to receive(:sample).and_return :paper
    expect(player.randomise_weapon_type).to eq :paper
  end

  it 'the Computer automatically chooses weapon' do
    allow_any_instance_of(Array).to receive(:sample).and_return :scissors
    # allow(player2).to receive(:a_computer?).and_return true
    # allow(player2).to receive(:choose_weapon).with(:scissors)
    expect(player2.choose_random_weapon).to eq :scissors
  end
end
