class Item < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than: 0 }

  belongs_to :user
end
