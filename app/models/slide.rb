require 'exifr'

class Slide < ApplicationRecord
  has_attached_file :attachment, styles: {preview: '300x300>', full: '1280x720>'}#, processors: [:artist_watermark]
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\z/     

  has_many :decks_slides, dependent: :destroy
  has_many :decks, through: :decks_slides

  validates :name, uniqueness: true
end
