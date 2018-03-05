require 'game'
require 'player'
require 'game'

describe 'RPS' do
  let(:player1) { Player.new 'Bob' }
  let(:player2) { Player.new 'Ken' }
  let(:computer) { Player.new 'Computer' }
  let(:game) { Game.start(player1, player2) }
  let(:computer_vs_human) { Game.start(player1, computer) }

  context 'with two players' do
    example "It's a win" do
      w1 = game.choose_weapon1 'rock'
      w2 = game.choose_weapon2 'scissors'
      game.throw w1, w2
      expect(game.result).to eq 1
    end

    example "It's a loss" do
      w1 = game.choose_weapon1 'scissors'
      w2 = game.choose_weapon2 'rock'
      game.throw w1, w2
      expect(game.result).to eq(-1)
    end

    example "It's a draw" do
      w1 = game.choose_weapon1 'paper'
      w2 = game.choose_weapon2 'paper'
      game.throw w1, w2
      expect(game.result).to eq 0
    end
  end

  context 'Playing against the computer' do
    before do
      allow_any_instance_of(Array).to receive(:sample).and_return :scissors
    end

    it 'Computer plays automatically against player 1 and wins' do
      w1 = computer_vs_human.choose_weapon1 'rock'
      w2 = computer_vs_human.choose_random_weapon
      computer_vs_human.throw(w1, w2)
      expect(computer_vs_human.result).to eq 1
    end

    it 'Computer plays automatically against player 1 and loses' do
      w1 = computer_vs_human.choose_weapon1 'paper'
      w2 = computer_vs_human.choose_random_weapon
      computer_vs_human.throw(w1, w2)
      expect(computer_vs_human.result).to eq(-1)
    end

    it 'Computer plays automatically against player 1 and makes a draw' do
      w1 = computer_vs_human.choose_weapon1 'scissors'
      w2 = computer_vs_human.choose_random_weapon
      computer_vs_human.throw(w1, w2)
      expect(computer_vs_human.result).to eq 0
    end
  end
end
