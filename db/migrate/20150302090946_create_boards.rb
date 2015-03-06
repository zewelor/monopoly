class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.references :game, index: true

      t.timestamps null: false
    end
    add_foreign_key :boards, :games, on_delete: :cascade
  end
end
