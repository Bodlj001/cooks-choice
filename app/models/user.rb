class User < ApplicationRecord
  has_many :bookings
  has_many :cooks, :through => :bookings
  has_many :renters, :class_name => "Booking", :foreign_key => "cook_id"
  has_many :rented_cooks, :through => :renters, :source => :user

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
