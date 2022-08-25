class Product < ApplicationRecord
  has_many :properties, dependent: :destroy
  accepts_nested_attributes_for :properties, allow_destroy: true, reject_if: :all_blank
end
