class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :supplier, null: true, foreign_key: true
      t.string :status
      t.integer :total_cents
      t.string :total_currency
      t.text :notes

      t.timestamps
    end
  end
end
