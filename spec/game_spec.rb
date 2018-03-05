require 'game'

describe Game do
  subject(:game) { Game.start(player1, player2) }
  let(:player1) { double :player, name: 'Bob' }
  let(:player2) { double :player, name: 'Scott' }
  let(:rock) { double :weapon, type: 'rock' }
  let(:scissors) { double :weapon, type: 'scissors' }


  it 'starts with two players' do
    expect(game.players.size).to eq 2
  end

  example '#player1' do
    expect(game.player1).to eq player1
  end

  example '#player2' do
    expect(game.player2).to eq player2
  end

  example '#choose_weapon1' do
    allow(player1).to receive(:choose_weapon).with(:rock).and_return rock
    expect(game.choose_weapon1(:rock)).to eq rock
  end

  example '#choose_weapon2' do
    allow(player2).to receive(:choose_weapon).with(:scissors).and_return scissors
    expect(game.choose_weapon2(:scissors)).to eq scissors
  end

  it 'gives the result' do
    allow(rock).to receive(:<=>).with(scissors).and_return 1
    game.throw rock, scissors
    expect(game.result).to eq 1
  end
end
