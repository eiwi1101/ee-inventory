class CreateProjectParts < ActiveRecord::Migration[6.0]
  def change
    create_table :project_parts do |t|
      t.references :project, null: false, foreign_key: true
      t.references :part, null: false, foreign_key: true
      t.integer :quantity_required
      t.string :symbols
      t.text :notes

      t.timestamps
    end
  end
end
