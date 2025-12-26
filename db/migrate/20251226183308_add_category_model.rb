class AddCategoryModel < ActiveRecord::Migration[8.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.text :description
      t.uuid :uuid, null: false, default: "gen_random_uuid()"

      t.timestamps
    end

    add_index :categories, :name, unique: true
  end
end
