# frozen_string_literal: true

class CreateCartItems < ActiveRecord::Migration[8.0]
  def change
    create_table :cart_items do |t|
      ## Relationships
      t.references :cart, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      ## Quantity of this item in the cart
      t.integer :quantity, default: 1, null: false

      t.timestamps
    end

    ## Composite unique index: prevent same item from appearing twice in one cart
    add_index :cart_items, [:cart_id, :item_id], unique: true
  end
end
