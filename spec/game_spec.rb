require 'game'

describe Game do
  subject(:game) { Game.new(bob, scott) }
  let(:bob) { double :Bob }
  let(:scott) { double :Scott, points: 10 }
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
    before do
      allow(bob).to receive(:weapon).and_return rock
      allow(bob).to receive(:update)
      allow(scott).to receive(:update)
    end

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

  context 'displays players points' do
    subject(:new_game) { Game.new ashley, computer }
    let(:ashley) { double :Ashley, weapon: 'paper'}
    let(:computer) { double :Computer, weapon: 'rock' }

    it 'updates players points' do
      allow(ashley).to receive(:update)
      new_game.throw
      new_game.update_players_points
    end
  end

  context 'Playing against the computer' do
    subject(:computer_vs_human) { Game.new(bob, computer) }
    let(:bob) { double :Bob }
    let(:computer) { double :Computer }
    before do
      allow(bob).to receive(:update)
      allow(computer).to receive(:update)
    end

    example 'the Computer plays and loses' do
      allow(bob).to receive(:weapon).and_return scissors
      allow(computer).to receive(:weapon).and_return paper
      allow(Weapon).to receive(:compare).with(scissors, paper).and_return 1
      computer_vs_human.throw
      expect(computer_vs_human.result).to eq 1
    end
  end

  context 'The end of the game' do
    subject(:finished_game) { Game.new(winning_player, other_player) }
    let(:winning_player) { double :Victor, points: 30 }
    let(:other_player) { double :Dave, points: 10 }

    describe '#game_over?' do
      it 'returns false if no-one of the players is at 30 points' do
        allow(bob).to receive(:points).and_return 25
        expect(game.game_over?).to eq false
      end

      it 'returns true if one of the players is at 30 points' do
        expect(finished_game.game_over?).to eq true
      end
    end

    describe '#loser' do
      it 'returns the player on 30 points' do
        expect(finished_game.winner).to eq winning_player
      end
    end
  end
end
