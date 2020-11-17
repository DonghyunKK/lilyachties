class YachtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @yachts = Yacht.all
  end

  def new
    @yacht = Yacht.new
    @booking = Booking.new
  end

  def show
    id = params[:id].to_i
    @yacht = Yacht.find(id)
  end

  def create
    @yacht = Yacht.create(yacht_params)
    @yacht.user = current_user
    if @yacht.save # ensures validations pass
      redirect_to yacht_path(@yacht.id)
    else
      render :new
    end
  end

  private

  def yacht_params
    params.require(:yacht).permit(:title, :description, :weekly_price, :coordinates,
                                  :average_rating, :length, :number_of_crew, :number_of_guests,
                                  :number_of_cabins, :beam, :cruising_speed, :build, :year)
  end
end
