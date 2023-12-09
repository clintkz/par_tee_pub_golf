class PubScore < ApplicationRecord
<<<<<<< HEAD
  belongs_to :round
  validates :score, presence: true
=======
  belongs_to :pub
  belongs_to :participant
>>>>>>> master
end
