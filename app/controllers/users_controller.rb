class UsersController < ApplicationController 
  get '/users/signup' do
    if !logged_in?
      erb :'/users/signup'  
    else
      redirect "/users/#{current_user.slug}" 
    end
  end

  post '/users/signup' do
    if params[:username] != "" || params[:email] != "" || params[:run_goal] != "" || params[:password] != ""
      @user = User.create(username: params[:username], email: params[:email], run_goal: params[:run_goal], password: params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.slug}"
    else
      erb :'/users/signup' # add error message about missing fields
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
    @user = User.find_by(params[:id])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.slug}"
    else
      redirect '/'
    end    
  end 

  get '/users/logout' do
    if logged_in?
      session.clear
      redirect '/'
    else
      redirect '/'
    end
  end

  get '/users/:slug' do
    if logged_in? 
      @user = current_user
      erb :'/users/show'
    else
      redirect '/' 
    end
  end

  post '/users/:slug' do
    if logged_in? 
      @user = current_user
      erb :'/users/show'
    else
      redirect '/' 
    end
  end
end