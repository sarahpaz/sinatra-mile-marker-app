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
    @run = Run.find_by_id(params[:id])
    @runs = Run.all
    if logged_in?
      if @run.user == current_user
        erb :'/runs/edit'
      else
        flash[:message] = "You can only edit your own runs."
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
     flash[:message] = "Your run has been updated."
    redirect "/users/#{@run.user.slug}"
    redirect_to_current_user
  end
  
  get '/runs/:id/delete' do
    @run = Run.find(params[:id])
    if logged_in?
      if @run.user == current_user
        erb :'/runs/delete'
      else
        flash[:message] = "You can only delete your own runs."
        redirect "/users/#{current_user.slug}"
      end
    else
      redirect '/'
    end
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