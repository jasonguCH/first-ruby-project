class Stock < ApplicationRecord

  validates :store_id, presence: true
  validates :product_id, presence: true
  validates_uniqueness_of :product_id, scope: :store_id
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :product
  belongs_to :store
end
