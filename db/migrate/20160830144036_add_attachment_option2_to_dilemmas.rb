class AddAttachmentOption2ToDilemmas < ActiveRecord::Migration
  def self.up
    change_table :dilemmas do |t|
      t.attachment :option2
    end
  end

  def self.down
    remove_attachment :dilemmas, :option2
  end
end
