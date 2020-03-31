class CreateBowlingGames < ActiveRecord::Migration[6.0]
  def change
    create_table :bowling_games do |t|
      t.jsonb :points, array: true
      t.integer :total_points, default: 0

      t.references :user, null: false, foreign_key: true
      t.references :bowling_lane, null: false, foreign_key: true

      t.timestamps
    end
  end
end
