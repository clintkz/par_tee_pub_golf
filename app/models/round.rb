class Round < ApplicationRecord
  belongs_to :participants
  has_many :pub_scores

  def round_total
    pub_scores=[]
    self.holes.each do |pub_score|
      pub_scores << pub_score.score
    end
    
    self.score = pub_scores.inject(0){|sum,x| sum + x }
    self.save
    self.score
  end
