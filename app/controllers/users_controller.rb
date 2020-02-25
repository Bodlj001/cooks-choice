class UsersController < ApplicationController
  def index
    @cooks = User.where(iscook: true)
  end

  def show
    @user = User.find(params[:id])
    get_bookings
  end

  private

  def get_bookings
    user_type = @user.iscook ? :cook : :user
    @bookings = Booking.where(user_type => @user).order(date: :asc)
  end
end
