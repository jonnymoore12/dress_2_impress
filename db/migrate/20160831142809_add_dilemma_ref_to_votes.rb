class AddDilemmaRefToVotes < ActiveRecord::Migration
  def change
    add_reference :votes, :dilemma, index: true, foreign_key: true
  end
end
