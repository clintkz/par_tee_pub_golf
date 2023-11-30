class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         def full_name
          "#{self.first_name} #{self.last_name}"
         end

         def all_details
          "#{self.first_name} #{self.last_name} #{self.email}"
         end
end
