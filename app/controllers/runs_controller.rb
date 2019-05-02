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
    @run = Run.find(params[:id])
    if logged_in?
      if @run.user == current_user
        erb :'/runs/edit'
      else
        redirect "/users/#{current_user.slug}"
      end
    else
      redirect '/'
    end
  end

  patch '/runs/:id' do
    @run = Run.find(params[:id])
    if @run.user == current_user
      @run.update(distance: params[:distance], time: params[:time], shoes: params[:shoes], notes: params[:notes], indoor_outdoor: params[:indoor_outdoor])
      redirect "/users/#{@run.user.slug}"
    else
      redirect "/users/#{current_user.slug}"
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