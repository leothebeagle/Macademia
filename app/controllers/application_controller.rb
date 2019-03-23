class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    erb :"index.html"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      Student.find(session[:user_id])
    end
  end

end
