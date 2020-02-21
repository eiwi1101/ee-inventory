class CreateManufacturerParts < ActiveRecord::Migration[6.0]
  def change
    create_table :manufacturer_parts do |t|
      t.references :manufacturer, null: false, foreign_key: true
      t.references :part, null: false, foreign_key: true
      t.string :part_number
      t.text :notes

      t.timestamps
    end
  end
end
