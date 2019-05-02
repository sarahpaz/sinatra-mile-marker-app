class RunsController < ApplicationController

  get '/runs/new' do
    erb :'/runs/new'
  end

  post '/runs/new' do
    if params[:distance] != "" 
      @run = Run.create(params)
    end
  end
end