class BookingsController < ApplicationController
  before_action :find_cook

  def create
    @booking = Booking.new(booking_params)
    @renter = User.find(current_user.id)
    @booking.cook = @user
    @booking.user = @renter
    if @booking.save
      redirect_to user_path(@renter)
      # TODO: some kind of success modal?
    else
      render "users/show_cook"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    @renter = User.find(params[:user_id])
    # redirect to the one who destroyed it!
    redirect_to user_path(@renter)
  end

  private

  def find_cook
    @user = User.find(params[:user_id])
  end

  def booking_params
    # user should not be able to book arbitrary user IDs! Only permit these.
    params.require(:booking).permit(:date, :location)
  end
end
