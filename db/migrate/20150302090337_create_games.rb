class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :turn,          default: 0
      t.integer :state
      t.integer :active_player_id

      t.timestamps null: false
    end
  end
end
