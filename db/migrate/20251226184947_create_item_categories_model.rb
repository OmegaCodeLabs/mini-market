class CreateItemCategoriesModel < ActiveRecord::Migration[8.0]
  def change
    create_table :item_categories do |t|
      t.references :item, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end

    add_index :item_categories, [ :item_id, :category_id ], unique: true
  end
end
