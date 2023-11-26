class Game < ApplicationRecord
  belongs_to :course
  has_many :participants
  has_many :users, through: :participants
end
