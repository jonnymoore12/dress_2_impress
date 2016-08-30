class CreateDilemmas < ActiveRecord::Migration
  def change
    create_table :dilemmas do |t|
      t.string :occasion

      t.timestamps null: false
    end
  end
end
