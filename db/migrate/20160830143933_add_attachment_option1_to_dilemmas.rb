class AddAttachmentOption1ToDilemmas < ActiveRecord::Migration
  def self.up
    change_table :dilemmas do |t|
      t.attachment :option1
    end
  end

  def self.down
    remove_attachment :dilemmas, :option1
  end
end
