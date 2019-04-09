class CreateTopPicks < ActiveRecord::Migration[5.1]
  def change
    create_table :top_picks do |t|
      t.integer :venue_id
      t.integer :dish_id
      t.integer :user_id

      t.timestamps
    end
  end
end
