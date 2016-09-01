class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :choice

      t.timestamps null: false
    end
  end
end
