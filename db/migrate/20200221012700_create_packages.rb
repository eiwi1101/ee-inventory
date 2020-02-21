class CreatePackages < ActiveRecord::Migration[6.0]
  def change
    create_table :packages do |t|
      t.string :name
      t.text :description
      t.boolean :surface_mount
      t.integer :width
      t.integer :height
      t.integer :length
      t.string :dimension_unit

      t.timestamps
    end
  end
end
