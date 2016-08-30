class AddUserRefToDilemmas < ActiveRecord::Migration
  def change
    add_reference :dilemmas, :user, index: true, foreign_key: true
  end
end
