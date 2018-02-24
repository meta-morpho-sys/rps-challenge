require 'game'

describe Game do
  subject(:rps) { Game.new(player1, player2) }
  let(:player1) { double :player, name: 'Bob' }
  let(:player2) { double :player, name: 'Scott' }

  it 'starts with two players' do
    expect(rps.players.size).to eq 2
  end
end
