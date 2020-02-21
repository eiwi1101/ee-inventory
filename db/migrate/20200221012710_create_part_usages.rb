class CreatePartUsages < ActiveRecord::Migration[6.0]
  def change
    create_table :part_usages do |t|
      t.references :part, null: false, foreign_key: true
      t.references :project, null: true, foreign_key: true
      t.references :project_part, null: true, foreign_key: true
      t.integer :quantity_used
      t.text :notes

      t.timestamps
    end
  end
end
