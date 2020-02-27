class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :cook, class_name: 'User', foreign_key: :cook_id

  validates_presence_of :user_id, :cook_id, :date, :location
end
