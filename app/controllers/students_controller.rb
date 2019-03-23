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
      session[:user_id] = student.id # have amethod that logs someone in
      redirect "students/#{student.id}" # could possibly refactor this to current_user
    end
  end

  get '/students/:id' do
    # can only view this page if logged in
    @student = Student.find(current_user.id)
    erb :"student/show.html"
  end

end
