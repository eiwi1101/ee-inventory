class CreatePartStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :part_stocks do |t|
      t.references :stock_location, null: false, foreign_key: true
      t.references :part, null: false, foreign_key: true
      t.integer :quantity_on_hand
      t.text :notes

      t.timestamps
    end
  end
end
