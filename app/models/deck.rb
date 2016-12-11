class Deck < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged

    has_and_belongs_to_many :slides

    def slide_urls
        slides.order(:name).map{|s| s.attachment.url(:full)}
    end
end
