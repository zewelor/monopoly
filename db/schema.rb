# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150302091128) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "boards", force: :cascade do |t|
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "boards", ["game_id"], name: "index_boards_on_game_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.integer  "turn",             default: 0
    t.integer  "state"
    t.integer  "active_player_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.float    "cash"
    t.integer  "game_id"
    t.integer  "tile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "players", ["name"], name: "index_players_on_name", unique: true, using: :btree

  create_table "tiles", force: :cascade do |t|
    t.integer "board_id"
    t.integer "number",                null: false
    t.string  "type"
    t.jsonb   "data",     default: {}
  end

  add_index "tiles", ["board_id"], name: "index_tiles_on_board_id", using: :btree

  add_foreign_key "boards", "games", on_delete: :cascade
  add_foreign_key "tiles", "boards", on_delete: :cascade
end
