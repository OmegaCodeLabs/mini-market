class Item < ApplicationRecord
  validates :name, :sku, :price, presence: true

  def to_param
    uuid
  end
end
