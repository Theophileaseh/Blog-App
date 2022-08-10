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

ActiveRecord::Schema[7.0].define(version: 0) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comment", id: false, force: :cascade do |t|
    t.integer "author_id"
    t.integer "post_id"
    t.string "text"
    t.date "created_at"
    t.date "updated_at"
  end

  create_table "likes", id: false, force: :cascade do |t|
    t.integer "author_id"
    t.integer "post_id"
    t.date "created_at"
    t.date "updated_at"
  end

  create_table "post", id: :integer, default: nil, force: :cascade do |t|
    t.integer "author_id"
    t.string "title"
    t.string "text"
    t.string "bio"
    t.date "created_at"
    t.date "updated_at"
    t.integer "comments_counter"
    t.integer "likes_counter"
  end

  create_table "users", id: :integer, default: nil, force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.string "bio"
    t.date "updated_at"
    t.date "created_at"
    t.integer "posts_counter"
    t.index ["created_at"], name: "users_created_at_key", unique: true
    t.index ["updated_at"], name: "users_updated_at_key", unique: true
  end

  add_foreign_key "comment", "post", name: "comment_post_id_fkey"
  add_foreign_key "comment", "users", column: "author_id", name: "comment_author_id_fkey"
  add_foreign_key "comment", "users", column: "created_at", primary_key: "created_at", name: "comment_created_at_fkey"
  add_foreign_key "comment", "users", column: "updated_at", primary_key: "updated_at", name: "comment_updated_at_fkey"
  add_foreign_key "likes", "post", name: "likes_post_id_fkey"
  add_foreign_key "likes", "users", column: "author_id", name: "likes_author_id_fkey"
  add_foreign_key "likes", "users", column: "created_at", primary_key: "created_at", name: "likes_created_at_fkey"
  add_foreign_key "likes", "users", column: "updated_at", primary_key: "updated_at", name: "likes_updated_at_fkey"
  add_foreign_key "post", "users", column: "author_id", name: "post_author_id_fkey"
end
