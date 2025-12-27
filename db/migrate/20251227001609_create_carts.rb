# frozen_string_literal: true

class CreateCarts < ActiveRecord::Migration[8.0]
  def change
    create_table :carts do |t|
      ## UUID for public-facing URLs
      t.uuid :uuid, default: 'gen_random_uuid()', null: false

      ## One cart belongs to one user
      t.references :user, null: false, foreign_key: true, index: { unique: true }

      t.timestamps
    end

    ## UUID index
    add_index :carts, :uuid, unique: true
  end
end
