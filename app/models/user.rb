class User < ApplicationRecord
  has_many :bookings
  has_many :cooks, :through => :bookings
  has_many :renters, :class_name => "Booking", :foreign_key => "cook_id"
  has_many :rented_cooks, :through => :renters, :source => :user
  has_one_attached :avatar
  has_many_attached :photos

  validates :iscook, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
