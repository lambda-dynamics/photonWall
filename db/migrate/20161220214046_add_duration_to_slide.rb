class AddDurationToSlide < ActiveRecord::Migration[5.0]
  def change
    add_column :slides, :duration, :integer
  end
end
