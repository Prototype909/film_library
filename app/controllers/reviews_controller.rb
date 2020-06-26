class  ReviewsController < ApplicationController

  get '/review' do
    if logged_in?
      @review = Review.all
      erb :'/reviews/show'
    end

  end

  post '/new_review' do
    review = Review.create(params[:descrpition])
    reveiw.user = current_user
    review.save
    redirect '/films'
  end

  get '/review/:id' do
    @review = Review.find(params[:id])
    review.update()
  end

  delete '/review/:id' do

  end
end


#make sure to associate and is conntct to current userc
