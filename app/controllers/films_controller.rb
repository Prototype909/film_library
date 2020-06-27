class FilmsController < ApplicationController

  get '/films' do
    if logged_in?
      @film = Film.all
      erb :'/films/index'
    else
      redirect to '/login'
    end
  end

  get '/films/new' do
    erb :'films/new'
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

  get '/films/:id' do
    if logged_in?
      @film = Film.find_by_id(params[:id])
      erb :'/films/show'
    else
      redirect '/login'
    end
  end

  get '/films/:id/edit' do
    if logged_in?
      @film = Film.find_by_id(params[:id])
      if @film && @film.user_id == current_user.id
        erb :'films/edit'
      else
        redirect to '/films'
      end
      else
        redirect to '/login'
      end
    end

    patch '/films/:id' do
      if logged_in?
        if params[:title] == ""
          redirect to "/films/#{params[:id]}/edit"
        else
          @film = Film.find_by_id(params[:id])
          if @film && @book.user == current_user
            if @book.update(title: params[:title])
              redirect to "/films/#{@film.id}"
            else
              redirect to "/films/#{@film.id}/edit"
            end
          else
            redirect to "/films"
          end
        end
      else
        redirect to "/login"
      end
    end
  # delete 'films/:id' do
  #   film = Film.find_by_id(params[:id])
  #
  # end
end
