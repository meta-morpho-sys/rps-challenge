require 'sinatra/base'
require './lib/game'
require './lib/player'
# require './lib/weapon'

# controller
class RockPaperScissors < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  before do
    @game = Game.instance_access
  end

  post '/start_game' do
    @game = Game.start params[:player_1_name], params[:player_2_name]
    redirect '/choice'
  end

  get '/choice' do
    erb :choice
  end

  post '/play' do
    p1 = @game.player1
    p2 = @game.player2
    weapon1 = params[:weapon_type]
    weapon2 = p2.a_computer? ? Weapon.random : params[:weapon_type]
    p1.weapon = weapon1
    p2.weapon = weapon2
    @game.throw
    redirect '/play'
  end

  get '/play' do
    erb :play
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
