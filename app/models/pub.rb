class Pub < ApplicationRecord
  belongs_to :course
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :pub_scores
  has_one_attached :photo
end
