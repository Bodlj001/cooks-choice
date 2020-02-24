class Cook < ApplicationRecord
  has_many :bookings
  has_many :users, through: :bookings
  has_one_attached :avatar
  has_many_attached :photos
end
