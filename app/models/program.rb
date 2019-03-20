class Program < ActiveRecord::Base
  belongs_to :student
  has_many :topics_programs
  has_many :topics, through: :topics_programs
end
