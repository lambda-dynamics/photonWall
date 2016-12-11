class CreateDecksSlides < ActiveRecord::Migration[5.0]
  def change
    create_table :decks_slides, id: false do |t|
      t.references :deck, foreign_key: true
      t.references :slide, foreign_key: true
    end
  end
end
