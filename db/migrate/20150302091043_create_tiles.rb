class CreateTiles < ActiveRecord::Migration
  def change
    create_table :tiles do |t|
      t.references  :board,   index: true
      t.integer     :number,  null: false
      t.string      :type
      t.jsonb       :data,    default: {}
    end
    add_foreign_key :tiles, :boards, on_delete: :cascade
  end
end
