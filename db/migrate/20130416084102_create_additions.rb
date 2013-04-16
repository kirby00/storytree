class CreateAdditions < ActiveRecord::Migration
  def change
    create_table :additions do |t|
      t.integer :user_id
      t.integer :round_id
      t.text :content

      t.timestamps
    end
  end
end
