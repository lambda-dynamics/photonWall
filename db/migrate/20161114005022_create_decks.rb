class CreateDecks < ActiveRecord::Migration[5.0]
  def change
    create_table :decks do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
    add_index :decks, :slug, unique: true
  end
end
