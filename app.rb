require 'sinatra/base'
require './lib/game'
require './lib/player'

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
    player1 = Player.new(params[:player_1_name])
    player2 = Player.new(params[:player_2_name])
    @game = Game.start(player1, player2)
    redirect '/choice'
  end

  get '/choice' do
    erb :choice
  end

  post '/play' do
    # do something with ROCK
    redirect '/play'
  end

  get '/play' do
    erb :play
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
