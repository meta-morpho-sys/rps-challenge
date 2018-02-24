require 'player'

describe Player do
  subject(:player) { Player.new :'Genghis Khan'}

  it 'has name' do
    expect(subject.name).to eq :'Genghis Khan'
  end
end
