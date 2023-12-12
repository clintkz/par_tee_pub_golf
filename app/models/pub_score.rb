class PubScore < ApplicationRecord
#<<<<<<< HEAD
#<<<<<<< HEAD
  belongs_to :round
  validates :score, presence: true
#=======
  belongs_to :pub
  belongs_to :participant
#>>>>>>> master
#=======
  belongs_to :participant
  belongs_to :pub
#>>>>>>> master
end
