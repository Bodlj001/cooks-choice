class UsersController < ApplicationController
  def index
    @cooks = User.where(iscook: true)
  end

  def show
    @user = User.find(params[:id])
    @review = Review.new
    @reviews = Review.all
    get_bookings
    @booking = Booking.new(cook: @user)
    if @user.iscook
      render :show_cook
    else
      render :show
    end
  end

  private

  def get_bookings
    user_type = @user.iscook ? :cook : :user
    @bookings = Booking.where(user_type => @user).order(date: :asc)
  end
end
