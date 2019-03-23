class StudentsController < ApplicationController

  get '/students/new' do
    erb :"students/create_student.html"
  end

  post '/students' do
    student = Student.create(:username => params[:username], :email => params[:email], :password => params[:password])
    session[:user_id] = student.id # have amethod that logs someone in
    redirect "students/#{student.id}" # could possibly refactor this to current_user
  end

  get '/students/:id' do
    @student = Student.find(current_user.id)
    erb :"students/show.html"
  end
end
