class AddToysToYachts < ActiveRecord::Migration[6.0]
  def change
    add_column :yachts, :toys, :string
  end
end
