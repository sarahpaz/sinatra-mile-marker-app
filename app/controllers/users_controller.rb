class UsersController < ApplicationController 

  get '/users/signup' do
    if !logged_in?
      erb :'/users/signup'  
    else
      redirect "/users/#{current_user.slug}" 
    end
  end

  post '/users/signup' do
    if User.exists?(username: params[:username])
      flash[:message] = "Sorry. that username is not available."
      erb :'/users/signup'
    elsif params[:username] != "" || params[:email] != "" || params[:run_goal] != "" || params[:password] != ""
      @user = User.create(params) 
      session[:user_id] = @user.id
      redirect "/users/#{@user.slug}"
    else
      erb :'/users/signup' 
    end
  end

  get '/users/login' do
    if !logged_in?
      erb :'/welcome'
    else
      redirect :"/users/#{current_user.slug}"
    end
  end

  post '/users/login' do
    @user = User.find_by(username: params[:username])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.slug}"
    else
      flash[:message] = "Sorry. that password is not valid."
      redirect '/'
    end    
  end 

  get '/users/logout' do
    session.clear
    redirect '/' 
  end

  get '/users/:slug' do
    @user = current_user
    redirect_if_not_logged_in 
    erb :'/users/show'
  end

end

