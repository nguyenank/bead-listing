class Bead < ApplicationRecord

  include PgSearch::Model

  pg_search_scope :global_search,
    against: [:brand, :size, :shape],
    associated_against: {
      colors: [:name]
    },
    using: {
      tsearch: {any_word: true}
    }
  # all image related functionality taken from
  # https://medium.com/@anaharris/how-to-add-image-upload-functionality-to-your-rails-app-9f7fc3f3d042
  has_one_attached :photo
  validates :brand, presence: true
  #validates :color, presence: true, length: {maximum: 32}
  acts_as_taggable_on :colors
  validates :size, presence: true, length: {maximum: 32}
  validates :shape, presence: true, length: {maximum: 32}
  validates :description, length: {maximum: 100000}

end
