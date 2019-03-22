class StudentsController < ApplicationController

  get '/students/new' do
    erb :"students/create_student.html"
  end
  
end
