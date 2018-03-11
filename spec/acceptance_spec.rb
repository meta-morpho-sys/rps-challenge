require 'game'
require 'player'
require 'game'

describe 'RPS' do
  let(:player1) { Player.new 'Bob' }
  let(:player2) { Player.new 'Ken' }
  let(:game) { Game.start(player1, player2) }

  context 'with two players' do
    example "it's a win" do
      player1.weapon = Weapon::ROCK
      player2.weapon = Weapon::SCISSORS
      game.throw
      expect(game.result).to eq 1
    end

    example "it's a loss" do
      player1.weapon = Weapon::SCISSORS
      player2.weapon = Weapon::ROCK
      game.throw
      expect(game.result).to eq(-1)
    end

    example "it's a draw" do
      player1.weapon = Weapon::PAPER
      player2.weapon = Weapon::PAPER
      game.throw
      expect(game.result).to eq 0
    end
  end

  context 'playing against the computer' do
    let(:computer) { Player.new 'Computer' }
    let(:computer_vs_human) { Game.start(player1, computer) }
    before do
      allow_any_instance_of(Array).to receive(:sample).and_return 'scissors'
    end

    it 'computer plays automatically against player 1 and wins' do
      player1.weapon = Weapon::ROCK
      computer.weapon = Weapon.random
      computer_vs_human.throw
      expect(computer_vs_human.result).to eq 1
    end

    it 'computer plays automatically against player 1 and loses' do
      player1.weapon = Weapon::PAPER
      computer.weapon = Weapon.random
      computer_vs_human.throw
      expect(computer_vs_human.result).to eq(-1)
    end

    it 'computer plays automatically against player 1 and makes a draw' do
      player1.weapon = Weapon::SCISSORS
      computer.weapon = Weapon.random
      computer_vs_human.throw
      expect(computer_vs_human.result).to eq 0
    end
  end
end
