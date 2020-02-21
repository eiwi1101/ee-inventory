class CreatePartProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :part_properties do |t|
      t.references :part, null: false, foreign_key: true
      t.references :property_type, null: false, foreign_key: true
      t.decimal :property_value
      t.decimal :property_value_min
      t.decimal :property_value_max
      t.string :property_value_str

      t.timestamps
    end
  end
end
