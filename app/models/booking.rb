class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :cook, :class_name => 'User'
end
