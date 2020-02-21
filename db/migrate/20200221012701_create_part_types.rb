class CreatePartTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :part_types do |t|
      t.string :name
      t.references :category, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
