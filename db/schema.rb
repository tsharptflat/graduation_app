# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2026_04_05_142757) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "character_expressions", force: :cascade do |t|
    t.bigint "character_type_id", null: false
    t.string "emotion_type", null: false
    t.string "image_path", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_type_id", "emotion_type"], name: "idx_char_expressions_on_type_and_emotion", unique: true
    t.index ["character_type_id"], name: "index_character_expressions_on_character_type_id"
  end

  create_table "character_text_conditions", force: :cascade do |t|
    t.bigint "character_type_id", null: false
    t.integer "page", null: false
    t.integer "friendship_level", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_type_id", "page", "friendship_level"], name: "idx_char_text_cond_on_type_page_level", unique: true
    t.index ["character_type_id"], name: "index_character_text_conditions_on_character_type_id"
  end

  create_table "character_texts", force: :cascade do |t|
    t.bigint "character_text_condition_id", null: false
    t.bigint "character_expression_id"
    t.text "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_expression_id"], name: "index_character_texts_on_character_expression_id"
    t.index ["character_text_condition_id"], name: "index_character_texts_on_character_text_condition_id"
  end

  create_table "character_types", force: :cascade do |t|
    t.string "name", null: false
    t.string "image_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_character_types_on_name", unique: true
  end

  create_table "games", force: :cascade do |t|
    t.string "game_title"
    t.integer "steam_app_id"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "outfit_items", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.string "image_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_outfit_items_on_name", unique: true
  end

  create_table "user_characters", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "character_type_id", null: false
    t.string "name", null: false
    t.integer "friendship_point", default: 0, null: false
    t.bigint "outfit_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_type_id"], name: "index_user_characters_on_character_type_id"
    t.index ["outfit_item_id"], name: "index_user_characters_on_outfit_item_id"
    t.index ["user_id"], name: "index_user_characters_on_user_id"
  end

  create_table "user_game_libraries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.float "minutes_played", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "game_id", null: false
    t.index ["game_id"], name: "index_user_game_libraries_on_game_id"
    t.index ["user_id"], name: "index_user_game_libraries_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "steam_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["steam_id"], name: "index_users_on_steam_id", unique: true
  end

  add_foreign_key "character_expressions", "character_types"
  add_foreign_key "character_text_conditions", "character_types"
  add_foreign_key "character_texts", "character_expressions"
  add_foreign_key "character_texts", "character_text_conditions"
  add_foreign_key "user_characters", "character_types"
  add_foreign_key "user_characters", "outfit_items"
  add_foreign_key "user_characters", "users"
  add_foreign_key "user_game_libraries", "games"
  add_foreign_key "user_game_libraries", "users"
end
