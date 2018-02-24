require 'game'

describe Game do
  subject(:rps) { Game.new(player1, player2) }
  let(:player1) { double :player, name: 'Bob' }
  let(:player2) { double :player, name: 'Scott' }

  it 'starts with two players' do
    expect(rps.players.size).to eq 2
  end

  example '#player1' do
    expect(rps.player1).to eq player1
  end

  example '#player2' do
    expect(rps.player2).to eq player2
  end
end
