class Category < ApplicationRecord
  # Relationships (mirror of Item model)
  has_many :item_categories, dependent: :destroy
  has_many :items, through: :item_categories

  # Validations
  validates :name, presence: true, uniqueness: true

  # Use UUID in URLs instead of ID
  def to_param
    uuid
  end
end
