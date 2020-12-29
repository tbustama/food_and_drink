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

ActiveRecord::Schema.define(version: 2020_12_28_171720) do

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.string "recipe_type"
    t.integer "recipe_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recipe_type", "recipe_id"], name: "index_comments_on_recipe"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "drinks", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.text "ingredients"
    t.text "directions"
    t.string "image_url"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_drinks_on_user_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.text "ingredients"
    t.text "directions"
    t.string "image_url"
    t.integer "time"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_foods_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "favorites"
    t.integer "user_id", null: false
    t.string "post_type"
    t.integer "post_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_type", "post_id"], name: "index_likes_on_post"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "password_digest"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "comments", "users"
  add_foreign_key "drinks", "users"
  add_foreign_key "foods", "users"
  add_foreign_key "likes", "users"
end
