require 'sinatra/base'
require 'sinatra/flash'

class SessionsController < ApplicationController

  register Sinatra::Flash

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
      flash[:login_fail] = "Sorry, the username and password didn't match! Try Again."
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear if logged_in?
    redirect '/'
  end

end
