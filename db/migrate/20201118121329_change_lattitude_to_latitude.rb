class ChangeLattitudeToLatitude < ActiveRecord::Migration[6.0]
  def change
      rename_column :yachts, :lattitude, :latitude
  end
end
