class AddItemModel < ActiveRecord::Migration[8.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :items do |t|
      t.string :name, null: false
      t.text :description
      t.string :sku, null: false
      t.boolean :active, default: true
      t.decimal :price, precision: 12, scale: 2, null: false
      t.integer :stock_quantity, default: 0, null: false
      t.uuid :uuid, null: false, default: "gen_random_uuid()"

      t.timestamps
    end

    add_index :items, :sku, unique: true
  end
end
