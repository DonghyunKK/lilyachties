class YachtsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @yachts = Yacht.all
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @yachts.geocoded.map do |yacht|
      {
        lat: yacht.latitude,
        lng: yacht.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { yacht: yacht }),
        image_url: helpers.asset_url('ly_map_pin.png'),
        yachtId: yacht.id
      }
    end
  end

  def new
    @yacht = Yacht.new
  end

  def show
    id = params[:id]
    @yacht = Yacht.find(id)
    @photos = @yacht.photos
    @booking = Booking.new
    @markers = [
      {
        lat: @yacht.latitude,
        lng: @yacht.longitude,
        image_url: helpers.asset_url('ly_map_pin.png'),
        yachtId: @yacht.id
      }
    ]
  end

  def create
    # byebug
    @yacht = Yacht.new(yacht_params)
    @yacht.user = current_user
    puts @yacht
    if @yacht.save # ensures validations pass
      redirect_to yacht_path(@yacht.id)
    else
      raise
      render :new
    end
  end

  def edit
    @yacht = Yacht.find(params[:id])
  end

  def update
    @yacht = Yacht.find(params[:id])
    @yacht.update(yacht_params)
    if @yacht.save
      redirect_to yacht_path(@yacht.id)
    else
      render :edit
    end
  end

  def destroy
    @yacht = Yacht.find(params[:id])
    @yacht.delete
    redirect_to dashboard_path
  end

  private

  def yacht_params
    params.require(:yacht).permit(:title, :description, :weekly_price, :address,
                                  :length, :number_of_crew, :number_of_guests,
                                  :number_of_cabins, :beam, :cruising_speed, :build, :year, photos: [])
  end
end
