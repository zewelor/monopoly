class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string      :name
      t.float       :cash
      t.references  :game
      t.references  :tile

      t.timestamps null: false
    end

    add_index :players, :name, unique: true
  end
end
