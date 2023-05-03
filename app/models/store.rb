class Store < ApplicationRecord

  validates :name, presence: true, uniqueness: true, length: {maximum: 50}
  validates :address, presence: true
  validates :description, presence: true
  validates :location, presence: true

  has_many :products, through: :stocks
  has_many :stocks, dependent: :destroy
end
