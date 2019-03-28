class TopicsController < ApplicationController

  get '/topics' do
    @topics = Topic.all
    erb :"topics/index.html"
  end
end
