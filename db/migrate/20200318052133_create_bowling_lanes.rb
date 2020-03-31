class CreateBowlingLanes < ActiveRecord::Migration[6.0]
  def change
    create_table :bowling_lanes do |t|
      t.string :length, nil: false, default: '19.20'

      t.timestamps
    end
  end
end
