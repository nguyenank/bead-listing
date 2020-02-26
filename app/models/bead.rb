class Bead < ApplicationRecord
  validates :brand, presence: true
  validates :color, presence: true
  validates :size, presence: true
  validates :shape, presence: true
end
