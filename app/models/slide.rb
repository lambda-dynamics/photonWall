class Slide < ApplicationRecord
    has_attached_file :attachment, styles: {preview: '300x300>', full: '1280x720>'}
    validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\z/     

    has_and_belongs_to_many :decks
end
