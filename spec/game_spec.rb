require 'game'

describe Game do
  subject(:game) { Game.start(player1, player2) }
  subject(:computer_vs_human) { Game.start(player1, computer) }
  let(:player1) { double :player, name: 'Bob' }
  let(:player2) { double :player, name: 'Scott' }
  let(:computer) { double :player, name: 'Computer' }
  let(:rock) { double :weapon, type: 'rock' }
  let(:paper) { double :weapon, name: 'paper' }
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
    allow(player2).to receive(:choose_weapon).with(:paper).and_return paper
    expect(game.choose_weapon2(:paper)).to eq paper
  end

  context 'gives the result' do
    example 'positive' do
      allow(rock).to receive(:beats?).with(scissors).and_return 1
      game.throw rock, scissors
      expect(game.result).to eq 1
    end

    example 'negative' do
      allow(rock).to receive(:beats?).with(paper).and_return(-1)
      game.throw rock, paper
      expect(game.result).to eq(-1)
    end

    example 'draw' do
      allow(rock).to receive(:beats?).with(rock).and_return(0)
      game.throw rock, rock
      expect(game.result).to eq(0)
    end
  end

  context 'Playing against the computer' do
    example 'the Computer automatically chooses weapon' do
      allow(computer).to receive(:choose_random_weapon).and_return :paper
      expect(computer_vs_human.choose_random_weapon).to eq :paper
    end
  end
end
