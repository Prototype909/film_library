class UsersController < ApplicationController

    get '/signup' do
        redirect_if_not_logged_in
          erb :'users/signup'
        else
          redirect to '/films'
        end
      end

    post '/signup' do
        if params[:name] == "" || params[:email] == "" || params[:password] == ""
            redirect to '/signup'
        elsif User.all.any? { |user| user.name.downcase == params[:name].downcase}
           redirect to '/signup'
        else
            @user = User.new(:name => params[:name], :email => params[:email], :password => params[:password])
            @user.save
            session[:user_id] = @user.id
            redirect to '/films'
        end
    end

    get '/login' do
        redirect_if_not_logged_in
            erb :'users/login'
        else
            redirect to '/films'
        end
    end

    post '/login' do
        user = User.find_by_name(params[:name])
        #binding.pry
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect to "/films"
        else
            redirect to '/signup'
        end
    end

    get '/show' do
        @user = current_user
        erb :'users/show'
    end
 
    get '/logout' do
           session.destroy
            redirect to '/'
        end

  end
