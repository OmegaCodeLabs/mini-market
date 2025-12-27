# frozen_string_literal: true

class CreateOrderItems < ActiveRecord::Migration[8.0]
  def change
    create_table :order_items do |t|
      ## Relationships
      t.references :order, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      ## Snapshot at purchase time (item details can change later)
      t.string :item_name, null: false
      t.string :item_sku
      t.decimal :price, precision: 10, scale: 2, null: false
      t.integer :quantity, null: false

      t.timestamps
    end

    ## Indexes
    add_index :order_items, [:order_id, :item_id]
  end
end
