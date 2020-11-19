class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @yacht = Yacht.find(params[:yacht_id])
    @review.yacht = @yacht
    @review.user = current_user
    if @review.save!
      redirect_to yacht_path(@yacht.id)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.delete
    redirect_to yacht_path(@review.yacht.id)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
