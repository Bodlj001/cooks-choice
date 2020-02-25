class BookingsController < ApplicationController
  before_action :find_cook

  def new
    @booking = Booking.new(cook: @cook)
  end

  def create
    @booking = Booking.new(booking_params)
    @user = User.find(current_user.id)
    @booking.cook = @cook
    @booking.user = @user
    if @booking.save
      redirect_to user_path(@booking.cook)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    @user = User.find(params[:user_id])
    # redirect to the one who destroyed it!
    # only .user at the moment, but could be .cook
    redirect_to user_path(@user)
  end

  private

  def find_cook
    @cook = User.find(params[:user_id])
  end

  def booking_params
    # user should not be able to book arbitrary user IDs! Only permit these.
    params.require(:booking).permit(:date, :location)
  end
end
