class Booking < ApplicationRecord
  belongs_to :cook
  belongs_to :user
end
