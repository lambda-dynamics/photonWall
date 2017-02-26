class AddIdToDecksSlides < ActiveRecord::Migration[5.0]
  def change
    add_column :decks_slides, :id, :primary_key
  end
end
