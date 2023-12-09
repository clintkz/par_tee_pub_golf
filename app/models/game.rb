class Game < ApplicationRecord
  belongs_to :course
  # belongs_to :owner, class_name: "User"
  has_many :participants
  has_many :users, through: :participants
  has_one :chatroom

  def participant?(user)
    participants.where(user: user, status: 'accepted').exists? || user.id == user_id
  end
end
