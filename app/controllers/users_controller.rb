class  UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/profile'
    end
    erb :'users/signup'
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/profile'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/profile'
    end
    erb :'users/login'
  end
end
