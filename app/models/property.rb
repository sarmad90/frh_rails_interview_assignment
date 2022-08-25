class Property < ApplicationRecord
  belongs_to :product

  validates :name, :value, presence: true

  validates :name, uniqueness: { scope: :product_id }
end
