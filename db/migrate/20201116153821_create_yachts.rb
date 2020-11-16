class CreateYachts < ActiveRecord::Migration[6.0]
  def change
    create_table :yachts do |t|
      t.string :title
      t.string :description
      t.integer :weekly_price
      t.references :user, null: false, foreign_key: true
      t.string :coordinates
      t.integer :average_rating
      t.integer :length
      t.integer :number_of_crew
      t.integer :number_of_guests
      t.integer :number_of_cabins
      t.integer :beam
      t.integer :cruising_speed
      t.string :build
      t.integer :year

      t.timestamps
    end
  end
end
