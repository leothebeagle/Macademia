class SessionsController < ApplicationController
  #displaying the login page
  #processing the information input in the login page

  #verifying a sign-in
  #searching the db for the user and verifying that password is correct
  #set the seesion user_id to the students_id

  #logging out is basically just clearing the session.

  get '/login' do
    #only view this page if youre not logged in
    erb :"/sessions/login.html"
  end

  post '/login' do
    student = Student.find_by(:username => params[:username])
    if student && student.authenticate(params[:password])
      session[:user_id] = student.id
      redirect "/students/#{student.id}"
    else
      redirect '/failure'
    end
  end

  get '/logout' do
    session.clear if logged_in?
    redirect '/'
  end
  
end
