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
      @user = User.create(params)
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
    redirect '/' # add error message of successful logout
  end

  get '/users/:slug' do
    @user = current_user
    redirect_if_not_logged_in  # add error message to login to view show page
    erb :'/users/show'
  end

end

