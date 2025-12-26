class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  def to_param
    uuid
  end
end
