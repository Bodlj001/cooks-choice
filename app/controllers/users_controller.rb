class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @bookings = Booking.where(cook: @user)
  end
end
