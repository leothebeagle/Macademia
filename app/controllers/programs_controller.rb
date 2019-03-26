class ProgramsController < ApplicationController


  get '/programs' do
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
    new_program = Program.create(:name => params[:program_name])
    current_user.programs << new_program
    new_program.topic_ids = params[:topic_selections]
    new_program.save

    redirect "/programs/#{program.id}"
  end

  get '/programs/:id' do
    # look up the program using the program id
    # make sure that the program being looked up actually belongs to the current username
  end


end
