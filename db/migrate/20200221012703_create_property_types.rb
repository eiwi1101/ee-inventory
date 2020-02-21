class CreatePropertyTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :property_types do |t|
      t.string :name
      t.text :description
      t.string :property_unit
      t.string :property_unit_name
      t.boolean :numeric
      t.boolean :variable
      t.references :part_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
