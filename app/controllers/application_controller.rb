require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    set :sessions_secret, "secret"#ENV['SESSION_SECRET']
  end

  get "/" do
    if logged_in?
      redirect '/films'
    else
    erb :index
    end
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      if session[:user_id]
        current_user = User.find_by(id: session[:user_id])
      end
    end
  end
end
