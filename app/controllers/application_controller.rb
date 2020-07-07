require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "SESSION_SECRET"
  end

  not_found do
    status 404
    erb :error
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

    def redirect_if_not_logged_in
      if !logged_in? 
        redirect '/login'
      end
    end
  end
end
