class Product < ApplicationRecord
  validates :name, :description, :price, presence: true
  validates :name, uniqueness: true
end
