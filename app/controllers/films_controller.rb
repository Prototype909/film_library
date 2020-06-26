class FilmsController < ApplicationController

  get '/films' do
    if logged_in?
      @film = Film.all
      erb :'/films/index'
    else
      redirect to '/login'
    end
  end

  post '/films' do
    if logged_in?
    if params[:title] == ""
      redirect to "/films/new"
    else
      @film = Film.create(title: params[:title])
    if @film.save
      redirect to "/films/#{@film.id}"
    else
      redirect to "/films/new"
    end
  end
    else
      redirect to '/login'
    end
  end

  get '/films/new' do
    erb :'films/new'
  end

  get '/films/:id' do
    if logged_in?
      @film = Film.find_by_id(params[:id])
      erb :'/films/show'
    else
      redirect '/login'
    end
  end
end
