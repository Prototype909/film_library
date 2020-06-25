class FilmsController < ApplicationController

  get '/films' do
    if logged_in?
      @films = Films.all
      erb :'/films/index'
    else
      redirect to '/login'
    end
  end
end
