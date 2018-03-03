require 'game'
require 'player'
require 'game'


describe 'RPS' do
  let(:player1) { Player.new 'Bob' }
  let(:player2) { Player.new 'Ken' }
  let(:game) { Game.start(player1, player2) }

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
end
