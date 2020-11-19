class Toy < ApplicationRecord
  belongs_to :yacht

  def create
    @yacht = Yacht.find(params[:yacht_id])
    @toy = Toy.new
    @toy.yacht = @yacht
    @toy.save
  end
end
