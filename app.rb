require 'sinatra/base'

class RockPaperScissors < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    p params[:player_1_name]
  end





# start the server if ruby file executed directly
  run! if app_file == $0
end
