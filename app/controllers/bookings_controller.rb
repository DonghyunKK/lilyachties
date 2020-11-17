class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    # we need `yacht_id` to associate booking with corresponding yacht
    @yacht = Yacht.find(params[:yacht_id])
    @booking.yacht = @yacht
    @booking.user = current_user
    @booking.accepted = false
    if @booking.save # ensures validations pass
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
