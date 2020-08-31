class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :image, :name, :describe, :price, presence: true
  PRICE_REGEX = /[0-9]+\d/.freeze
  validates_format_of :price, with: PRICE_REGEX, message: 'Half-width number'
  validates :price, numericality: { greater_than: 299, less_than: 10_000_000, message: 'Out of setting range' }
  validates :category_id, numericality: { other_than: 0, message: 'Select' }
  validates :status_id, numericality: { other_than: 0, message: 'Select' }
  validates :delv_fee_id, numericality: { other_than: 0, message: 'Select' }
  validates :ship_from_id, numericality: { other_than: 0, message: 'Select' }
  validates :delv_days_id, numericality: { other_than: 0, message: 'Select' }
end
