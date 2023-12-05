class Participant < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_many :pub_scores
end
