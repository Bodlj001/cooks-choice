class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :cook, class_name: 'User', foreign_key: :cook_id

  validates :user_id, presence: true
  validates :cook_id, presence: true
end
