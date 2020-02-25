class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to user_bookings_path(@booking)
    else
      render :new
    end
  end


  private

  def booking_params
    params.require(:booking).permit(:user_id, :cook_id, :date, :location)
  end
end
