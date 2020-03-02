class Bead < ApplicationRecord
  validates :brand, presence: true
  validates :color, presence: true, length: {maximum: 32}
  validates :size, presence: true, length: {maximum: 32}
  validates :shape, presence: true, length: {maximum: 32}
  validates :description, length: {maximum: 100000}
end
