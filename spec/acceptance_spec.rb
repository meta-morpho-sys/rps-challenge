require 'game'
require 'player'
require 'game'


describe 'RPS' do
  let(:player1) { Player.new 'Bob' }
  let(:player2) { Player.new 'Ken' }
  let(:computer) { Player.new 'Computer' }
  let(:game) { Game.start(player1, player2) }
  let(:computer_vs_human) { Game.start(player1, computer) }

  example 'players choose their weapons and win a throw' do
    weapon1 = game.choose_weapon1 'rock'
    weapon2 = game.choose_weapon2 'scissors'
    expect(game.throw(weapon1, weapon2)).to eq 1
  end

  example 'players choose their weapons and lose a throw' do
    weapon1 = game.choose_weapon1 'scissors'
    weapon2 = game.choose_weapon2 'rock'
    expect(game.throw(weapon1, weapon2)).to eq(-1)
  end

  context 'Playing against the computer' do
    it 'plays automatically against player 1' do
      weapon1 = computer_vs_human.choose_weapon1 'rock'
      allow_any_instance_of(Array).to receive(:sample).and_return :scissors
      weapon2 = computer_vs_human.choose_random_weapon
      expect(computer_vs_human.throw(weapon1, weapon2)).to eq(1)
    end
  end
end
