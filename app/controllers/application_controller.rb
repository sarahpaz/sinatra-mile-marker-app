require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "mile_marker_app"
  end

  get "/" do
    erb :welcome
  end

  helpers do 
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect '/'
      end
    end

    def redirect_to_current_user
      if @run.user != current_user
        redirect "/users/#{current_user.slug}"
      end
    end
  end

end
