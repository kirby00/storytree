class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :story_id
      t.integer :winner_id

      t.timestamps
    end
  end
end
