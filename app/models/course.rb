class Course < ApplicationRecord
  has_many :pubs
  has_many :games
end
