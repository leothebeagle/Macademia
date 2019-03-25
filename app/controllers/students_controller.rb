class StudentsController < ApplicationController

  get '/students/new' do
    # only view this page if youre not logged in
    if !logged_in?
      erb :"students/create_student.html"
    else
      redirect "students/#{current_user.id}"
    end
  end

  post '/students' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect '/students/new' #include a message that you need to input data in all fields
    else
      student = Student.create(:username => params[:username], :email => params[:email], :password => params[:password])
      session[:user_id] = student.id # have a method that logs someone in
      redirect "students/#{student.id}" # could possibly refactor this to current_user
    end
  end

  get '/students/:id' do
    # can only view this page if logged in and if you are the actual user
    if logged_in? && params[:id].to_i == current_user.id
      @student = current_user
      erb :"students/show.html"
    else
      redirect '/failure'
    end
  end

end
