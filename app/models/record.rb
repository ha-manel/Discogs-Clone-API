class Record < ApplicationRecord
  validates :title, presence: true
  validates :artist, presence: true
  validates :year, presence: true
  validates :genre, presence: true

  has_one_attached :image_data

  after_commit :add_default_cover, on: %i[create update]

  private

  def add_default_cover
    return if image_data.attached?

    image_data.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default.png')),
                      filename: 'default.png', content_type: 'image/png')
  end
end
