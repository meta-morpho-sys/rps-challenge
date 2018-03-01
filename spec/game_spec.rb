require 'game'

describe Game do
  subject(:rps) { Game.new(player1, player2) }
  let(:player1) { double :player, name: 'Bob' }
  let(:player2) { double :player, name: 'Scott' }
  let(:rock) { double :weapon }
  let(:scissors) { double :weapon }


  it 'starts with two players' do
    expect(rps.players.size).to eq 2
  end

  example '#player1' do
    expect(rps.player1).to eq player1
  end

  example '#player2' do
    expect(rps.player2).to eq player2
  end

  example '#weapon1' do
    allow(player1).to receive(:weapon)
    expect(rps.weapon1).to eq rock
  end

  example 'winning weapon' do
    allow(rock).to receive(:beats?).with(:scissors).and_return :win
    expect(rps.result(:rock, :scissors)).to eq :win
  end
end
