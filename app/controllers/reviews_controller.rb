class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @user = User.find(params[:user_id])
    @booking = Booking.new
    @review.user = @user
    if @review.save
      redirect_to user_path(@user)
    else
      render "users/show_cook"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
