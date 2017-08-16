class ReviewsController < ApplicationController


  def new
    @profile = Profile.find(params[:profile_id])
    @review = Review.new
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @review = Review.new(review_params)
    @review.profile = @profile
    @review.user = current_user

    if @review.save
        redirect_to reservations_path
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end


