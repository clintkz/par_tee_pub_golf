class Game < ApplicationRecord
  belongs_to :course
  # belongs_to :owner, class_name: "User"
  has_many :participants
  has_many :users, through: :participants
  has_one :chatroom

  validates :date_time, presence: true
  validate :must_have_participants

  def participant?(user)
    participants.where(user: user, status: 'accepted').exists? || user.id == user_id
  end

  private

  def must_have_participants
    errors.add(:base, "You must add at least one participant") if self.user_ids.blank? || self.user_ids.reject(&:blank?).empty?
  end
end
