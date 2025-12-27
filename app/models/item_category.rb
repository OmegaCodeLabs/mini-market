class ItemCategory < ApplicationRecord
  belongs_to :item
  belongs_to :category

  # Prevent duplicate item-category pairs
  validates :item_id, uniqueness: { scope: :category_id }
end
