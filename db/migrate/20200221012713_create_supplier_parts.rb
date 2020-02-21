class CreateSupplierParts < ActiveRecord::Migration[6.0]
  def change
    create_table :supplier_parts do |t|
      t.references :supplier, null: false, foreign_key: true
      t.references :part, null: false, foreign_key: true
      t.references :manufacturer_part, null: true, foreign_key: true
      t.string :part_number
      t.text :notes

      t.timestamps
    end
  end
end
