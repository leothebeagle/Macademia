class TopicsProgram < ActiveRecord::Base
  belongs_to :topic
  belongs_to :program 
end
