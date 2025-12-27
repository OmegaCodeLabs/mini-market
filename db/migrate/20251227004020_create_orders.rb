# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      ## UUID for public-facing URLs
      t.uuid :uuid, default: 'gen_random_uuid()', null: false

      ## Relationship: order belongs to user
      t.references :user, null: false, foreign_key: true

      ## Order details
      t.decimal :total, precision: 10, scale: 2, null: false
      t.string :status, default: 'pending', null: false

      ## Shipping information (simple approach for MVP)
      t.string :shipping_name
      t.string :shipping_address
      t.string :shipping_city
      t.string :shipping_state
      t.string :shipping_zip
      t.string :shipping_country

      t.timestamps
    end

    ## Indexes
    add_index :orders, :uuid, unique: true
    add_index :orders, :status
  end
end
