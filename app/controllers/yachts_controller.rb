class YachtsController < ApplicationController
  def index
    @yachts = Yacht.all
  end

  def new
    @yacht = Yacht.new
  end

  def show
    id = params[:id].to_i
    @yacht = Yacht.find(id)
  end

  def create
    @yacht = Yacht.create(yacht_params)
    redirect_to yacht_path(@yacht.id)
  end

  private

  def yacht_params
    params.require(:yacht).permit(:title, :description, :weekly_price, :coordinates,
                                  :average_rating, :length, :number_of_crew, :number_of_guests,
                                  :number_of_cabins, :beam, :cruising_speed, :build, :year)
  end
end
