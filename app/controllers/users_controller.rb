class UsersController < ApplicationController
  def index
    @cooks = User.where(iscook: true)
  end

  def show
    @user = User.find(params[:id])
    @bookings = Booking.where(cook: @user)
  end
end
