# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      ## UUID for public-facing URLs
      t.uuid :uuid, default: 'gen_random_uuid()', null: false

      ## User profile info
      t.string :name
      t.string :last_name
      t.string :username  # Optional display name
      t.boolean :admin, default: false, null: false

      ## Database authenticatable (email + password login)
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable (password reset via email)
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable ("Remember me" checkbox)
      t.datetime :remember_created_at

      t.timestamps null: false
    end

    ## Indexes for performance and uniqueness
    add_index :users, :uuid,                 unique: true
    add_index :users, :username,             unique: true
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
