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

  private

  def find_cook
    @cook = User.find(params[:user_id])
  end

  def booking_params
    # user should not be able to book arbitrary user IDs! Only permit these.
    params.require(:booking).permit(:date, :location)
  end
end
