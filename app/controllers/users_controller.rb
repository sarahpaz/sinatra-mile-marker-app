class UsersController < ApplicationController 

  get '/users/login' do
    
    if !logged_in?
      erb :'/welcome'
    else
      redirect :"/users/#{@current_user.slug}"
    end
  end

  post '/users/login' do
    @user = User.find_by(params[:id])
    
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.slug}"
      erb :'/users/show'
    else
      redirect '/'
    end    
  end 

  get '/users/:slug' do
    @run = Run.all
    erb :'/users/show'
  end

 
end