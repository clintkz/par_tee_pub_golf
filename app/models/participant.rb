class Participant < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_many :pub_scores
  def total_score
    pub_scores.sum(:score)
  end
end
