class BookingsController < ApplicationController
  def index
    @yacht = Yacht.find(params[:yacht_id])
    @bookings = Booking.where(yacht_id: params[:yacht_id])
  end

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

  def accept
    @booking = Booking.find(params[:id])
    @booking.accepted = true
    @booking.save
    redirect_to dashboard_path
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.accepted = false
    @booking.save
    redirect_to dashboard_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.delete
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
