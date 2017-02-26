class Deck < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged

    has_many :decks_slides
    has_many :slides, through: :decks_slides

    def slide_urls
      decks_slides.order(:order).map{|ds| {duration: ds.slide.duration, url: ds.slide.attachment.url(:full)}}
    end
end
