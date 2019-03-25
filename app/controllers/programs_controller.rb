class ProgramsController < ApplicationController


  get '/programs' do
    @propgrams = current_user.programs
    erb :"programs/index.html"
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
    raise params.inspect
  end

  get '/programs/:id' do
    # look up the program using the program id
    # make sure that the program being looked up actually belongs to the current username
  end


end
