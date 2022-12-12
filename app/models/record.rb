class Record < ApplicationRecord
  validates :title, presence: true
  validates :artist, presence: true
  validates :year, presence: true
  validates :genre, presence: true

  has_one_attached :image_data
end
