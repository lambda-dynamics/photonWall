class AddOrderToDecksSlides < ActiveRecord::Migration[5.0]
  def change
    add_column :decks_slides, :order, :integer
  end
end
