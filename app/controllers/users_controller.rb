class UsersController < ApplicationController 
  
  get '/users/signup' do 
    erb :'/users/signup'
  end

  post '/users/signup' do
    if params[:username].empty? || params[:email].empty? || params[:run_goal].empty? || params[:password].empty?
      redirect '/users/signup'
    else
      @user = User.new(params)
      @user.save
      session[:user_id] = @user.user_id
      redirect "/users/#{@user.id}"
    end
  end

end