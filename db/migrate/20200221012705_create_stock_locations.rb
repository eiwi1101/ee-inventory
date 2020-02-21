class CreateStockLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_locations do |t|
      t.string :name
      t.text :description
      t.string :parts_count

      t.timestamps
    end
  end
end
