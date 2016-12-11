class AddAttachmentAttachmentToSlides < ActiveRecord::Migration
  def self.up
    change_table :slides do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :slides, :attachment
  end
end
