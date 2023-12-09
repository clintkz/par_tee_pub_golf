class Participant < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_many :pubscores
end
