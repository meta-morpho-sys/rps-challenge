require 'game'
require 'player'
require 'game'


describe 'RPS' do
  let(:player1) { Player.new 'Bob' }
  let(:player2) { Player.new 'Ken' }
  let(:game) { Game.start(player1, player2) }

  example 'players choose their weapons and win a throw' do
    player1.choose_weapon 'rock'
    player2.choose_weapon 'scissors'
    weapon1 = game.weapon1
    weapon2 = game.weapon2
    expect(game.result(weapon1, weapon2)).to eq :win
  end
end
