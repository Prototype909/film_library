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
      @film = Film.create(title: params[:title], user_id: current_user.id)
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

    patch '/films/:id/edit' do
      if logged_in?
        if params[:title] == ""
          redirect to "/films/#{params[:id]}/edit"
        else
          @film = Film.find_by_id(params[:id])
          if @film && @film.user_id == current_user.id
            if @film.update(title: params[:title], user_id: current_user.id)
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

   delete '/films/:id/delete' do
     if logged_in?
       @film = Film.find_by_id(params[:id])
     if @film && @film.user.id == current_user.id
        @film.delete
      end
        redirect to "/films"
      else redirect to "/logged_in"
      end
   end
end
