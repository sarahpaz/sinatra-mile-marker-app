class RunsController < ApplicationController

  get '/runs/new' do
    redirect_if_not_logged_in
    erb :'/runs/new'
  end

  post '/runs' do
    params[:distance] != "" && params[:time] != "" && params[:shoes] != "" && params[:indoor_outdoor] != ""
    @run = Run.create(distance: params[:distance], time: params[:time], shoes: params[:shoes], notes: params[:notes], indoor_outdoor: params[:indoor_outdoor], user_id: current_user.id)
    flash[:message] = "Your run has been added."
    redirect "/users/#{@run.user.slug}"
    redirect_to_current_user
  end

  get '/runs/:id/edit' do
    @run = Run.find(params[:id])
    @runs = Run.all
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
    @run.user == current_user
    @run.update(distance: params[:distance], time: params[:time], shoes: params[:shoes], notes: params[:notes], indoor_outdoor: params[:indoor_outdoor])
    redirect "/users/#{@run.user.slug}"
    redirect_to_current_user
  end
  
  get '/runs/:id/delete' do
    @run = Run.find(params[:id])
    erb :'/runs/delete'
  end

  delete '/runs/:id' do
    @run = Run.find(params[:id])
    @run.user == current_user
    @run.destroy
    flash[:message] = "Your run has been deleted."
    redirect "/users/#{@run.user.slug}"
    redirect_to_current_user
  end
end