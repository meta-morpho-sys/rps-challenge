require 'game'

describe Game do
  subject(:game) { Game.new(bob, scott) }
  let(:bob) { double :Bob }
  let(:scott) { double :Scott }
  let(:rock) { double 'rock' }
  let(:paper) { double 'paper' }
  let(:scissors) { double 'scissors' }

  it 'starts with two players' do
    expect(game.players.size).to eq 2
  end

  example '#player1' do
    expect(game.player1).to eq bob
  end

  example '#player2' do
    expect(game.player2).to eq scott
  end

  context 'gives the result' do
    before { allow(bob).to receive(:weapon).and_return rock }

    example 'positive' do
      allow(Weapon).to receive(:compare).with(rock, scissors).and_return 1
      allow(scott).to receive(:weapon).and_return scissors
      game.throw
      expect(game.result).to eq 1
    end

    example 'negative' do
      allow(Weapon).to receive(:compare).with(rock, paper).and_return(-1)
      allow(scott).to receive(:weapon).and_return paper
      game.throw
      expect(game.result).to eq(-1)
    end

    example 'draw' do
      allow(Weapon).to receive(:compare).with(rock, rock).and_return 0
      allow(scott).to receive(:weapon).and_return rock
      game.throw
      expect(game.result).to eq 0
    end
  end

  context 'Playing against the computer' do
    subject(:computer_vs_human) { Game.new(bob, computer) }
    let(:bob) { double :Bob }
    let(:computer) { double :Computer }

    example 'the Computer plays and loses' do
      allow(bob).to receive(:weapon).and_return scissors
      allow(computer).to receive(:weapon).and_return paper
      allow(Weapon).to receive(:compare).with(scissors, paper).and_return 1
      computer_vs_human.throw
      expect(computer_vs_human.throw).to eq 1
    end
  end
end
