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

  example '#weapon1' do
    allow(player1).to receive(:weapon).and_return rock
    expect(game.weapon1).to eq rock
  end

  example '#weapon2' do
    allow(player2).to receive(:weapon).and_return scissors
    expect(game.weapon2).to eq scissors
  end

  example 'a winning weapon' do
    allow(rock).to receive(:beats?).with(scissors).and_return :win
    expect(game.result(rock, scissors)).to eq :win
  end
end
