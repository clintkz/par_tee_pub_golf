class PubScore < ApplicationRecord
  belongs_to :pub
  belongs_to :participant
end
