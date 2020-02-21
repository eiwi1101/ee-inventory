class CreateOrderParts < ActiveRecord::Migration[6.0]
  def change
    create_table :order_parts do |t|
      t.references :order, null: false, foreign_key: true
      t.references :part, null: false, foreign_key: true
      t.integer :quantity_on_order
      t.integer :total_cents
      t.integer :amount_cents
      t.string :total_currency
      t.text :notes

      t.timestamps
    end
  end
end
