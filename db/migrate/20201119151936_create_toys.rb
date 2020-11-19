class CreateToys < ActiveRecord::Migration[6.0]
  def change
    create_table :toys do |t|
      t.string :name
      t.references :yacht, null: false, foreign_key: true

      t.timestamps
    end
  end
end