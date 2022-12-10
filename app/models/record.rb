class Record < ApplicationRecord
  validates :title, presence: true
  validates :artist, presence: true
  validates :year, presence: true
  validates :genre, presence: true
  validates :image_data, presence: true
end
