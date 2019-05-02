class RunsController < ApplicationController

  get '/runs/new' do
    erb :'/runs/new'
  end

  post '/runs/new' do
    if logged_in? && params[:distance] != "" || params[:time] != "" || params[:shoes] != "" || params[:indoor_outdoor] != ""
      @run = Run.create(params)
      @run.user = current_user
      @run.save
      redirect "/users/#{@run.user.slug}"
    else
      redirect "/users/#{current_user.slug}" # add error about run missing inputs
    end
  end
end