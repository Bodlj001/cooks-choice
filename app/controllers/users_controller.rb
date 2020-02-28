class UsersController < ApplicationController
  def index
    @cooks = User.where(iscook: true)
  end

  def show
    @user = User.find(params[:id])

    @review = Review.new
    @reviews = Review.where(user: @user)

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
    user_type1 = @user.iscook ? :cook : :user
    @bookings = Booking.where(user_type1 => @user).order(date: :asc)

    user_type2 = @user.iscook ? :user : :cook
    @viewer_can_review = @bookings.where(user_type2 => current_user).length > 0
  end
end
