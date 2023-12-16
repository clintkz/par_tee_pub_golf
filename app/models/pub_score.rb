class PubScore < ApplicationRecord

  validates :score, presence: true
  belongs_to :pub
  belongs_to :participant

end
