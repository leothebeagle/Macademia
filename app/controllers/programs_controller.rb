require 'sinatra/base'
require 'sinatra/flash'


class ProgramsController < ApplicationController

  register Sinatra::Flash

  get '/programs' do
    if !logged_in?
      flash[:notice] = "Oops!You will need to log in to access your program list"
      redirect '/failure'
    else
      @programs = current_user.programs
      erb :"programs/index.html"
    end
  end

  get '/programs/new' do
    if !logged_in?
      erb :"failure.html"
    else
      @topics = Topic.all
      erb :"programs/create_program.html"
    end
  end

  post '/programs' do
    if params[:program_name] == "" || params[:topic_selection].is_empty?
      redirect '/programs/new' #could also have an error message here explaining why
    else
      new_program = Program.create(:name => params[:program_name])
      current_user.programs << new_program
      new_program.topic_ids = params[:topic_selections]
      new_program.save

      redirect "/programs/#{new_program.id}"
    end
  end

  get '/programs/:id' do
    @program = Program.find(params[:id])
    @topics = @program.topics

    if logged_in? && @program.student == current_user
      erb :"programs/show.html"
    else
      redirect '/failure'
    end
  end

  delete '/programs/:id' do
    @program = Program.find(params[:id])

    if logged_in? && @program.student == current_user
      @program.delete
      redirect '/programs'
    else
      redirect '/failure'
    end
  end

  patch '/programs/:id' do
    program = Program.find(params[:id])
    if logged_in? && program.student == current_user && params[:program_name] != ""
      program.topic_ids = params[:topic_selections]
      program.save

      redirect "/programs/#{program.id}"
    else
      redirect '/failure'
    end
  end

  get '/programs/:id/edit' do
    @program = Program.find(params[:id])
    @topics = Topic.all

    if logged_in? && @program.student == current_user
      erb :"programs/edit.html"
    else
      redirect '/failure'
    end
  end


end
