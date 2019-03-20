class Topic < ActiveRecord::Base
  has_many :topics_programs
  has_many :programs, through: :topics_programs
end
