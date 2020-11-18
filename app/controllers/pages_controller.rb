class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @top_rated = Yacht.order(average_rating: :desc).limit(3)
  end

  def dashboard
    @yachts = Yacht.where(:user_id == current_user.id)
    @bookings = Booking.where(:user_id == current_user.id)
  end
end
