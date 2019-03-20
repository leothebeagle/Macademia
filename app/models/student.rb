class Student < ActiveRecord::Base
  has_secure_password
  has_many :programs
  has_many :topics, through: :programs
end
