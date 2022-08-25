class Product < ApplicationRecord
  VALID_UPC_SIZES = [10, 12, 13].freeze

  has_many :properties, dependent: :destroy
  accepts_nested_attributes_for :properties, allow_destroy: true, reject_if: :all_blank

  validates :name, :upc, :available_on, presence: true
  validates :name, uniqueness: true
  validates :upc, uniqueness: true, numericality: true
  validate :upc_is_right_size
  validate :available_on_is_in_future

  def save
    super
  rescue PG::UniqueViolation, ActiveRecord::RecordNotUnique => exception
    errors.add(:properties, 'duplicates found')
    false
  end

  private

  def upc_is_right_size
    return if VALID_UPC_SIZES.include?(upc.length)

    errors.add(:upc, 'can either be 10, 12 or 13 characters long')
  end

  def available_on_is_in_future
    return if available_on.blank? || available_on.future?

    errors.add(:available_on, 'date and time must be in future')
  end
end
