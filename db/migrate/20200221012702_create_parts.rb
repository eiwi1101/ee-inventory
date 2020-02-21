class CreateParts < ActiveRecord::Migration[6.0]
  def change
    create_table :parts do |t|
      t.string :name
      t.text :description
      t.string :part_number
      t.references :package, null: false, foreign_key: true
      t.decimal :value
      t.string :value_unit
      t.integer :quantity_ordered
      t.integer :quantity_on_hand
      t.integer :quantity_on_order
      t.integer :quantity_used

      t.timestamps
    end
  end
end
