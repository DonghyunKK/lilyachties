class RemoveLatLong < ActiveRecord::Migration[6.0]
  def change
    remove_column :yachts, :latitude
    remove_column :yachts, :longitude
  end
end
