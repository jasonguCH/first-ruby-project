class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: {maximum: 50}
  validates :price, presence: true
  validates :description, presence: true
  validates :brand, presence: true

  has_many :stores, through: :stocks
  has_many :stocks, dependent: :destroy

end

