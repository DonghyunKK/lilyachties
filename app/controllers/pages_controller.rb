class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @top_rated = Yacht.order(average_rating: :desc).limit(3)
  end

  def dashboard
    @yachts = Yacht.where(user: current_user)
    @bookings = Booking.where(user: current_user)
  end
end
