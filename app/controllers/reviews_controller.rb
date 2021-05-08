class ReviewsController < ApplicationController

  def index
    @booking = Booking.find(params[:booking_id])
    @reviews = @booking.review

  end

  def create

   @booking = Booking.find(params[:booking_id])
      @review = Review.new(review_params)
      authorize @booking
      @review.booking = @booking

    if @review.save!
      redirect_to kitchens_path(@kitchen)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

private

  def review_params
    params.require(:review).permit(:comment)
  end
end
