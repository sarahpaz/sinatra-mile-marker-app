class RunsController < ApplicationController

  get '/runs/new' do
    erb :'/runs/new'
  end

  post '/runs/new' do
    if logged_in? && params[:distance] != "" && params[:time] != "" && params[:shoes] != "" && params[:indoor_outdoor] != ""
      @run = Run.create(params)
      @run.user = current_user
      @run.save
      redirect "/users/#{@run.user.slug}"
    else
      redirect "/users/#{current_user.slug}" # add error about run missing inputs
    end
  end


  get '/runs/:id/edit' do
    if logged_in?
      @run = Run.find(params[:id])
      erb :'/runs/edit'
    else
      redirect '/'
    end
  end

  patch '/runs/:id/edit' do
    @run = Run.find(params[:id])
    if params[:distance] != "" && params[:time] != "" && params[:shoes] != "" && params[:notes] != "" && params[:indoor_outdoor] != ""
      @run.update(params)
      @run.save
      redirect "/runs/#{@run.id}"
    else
      redirect "/runs/edit/#{@run.id}"
    end
  end
  
  get '/runs/:id' do
    @run = Run.find(params[:id])
    if @run.user == current_user
      @run.destroy
      redirect "/users/#{@run.user.slug}"
    else
      redirect "/users/#{@run.user.slug}"
    end
  end
end