class Item < ApplicationRecord
  validates :name, presence: true
  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than: 0 }
end
