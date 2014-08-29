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

ActiveRecord::Schema.define(version: 20140828211344) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "collection_items", force: true do |t|
    t.integer  "collection_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "collection_items", ["collection_id", "product_id"], name: "index_collection_items_on_collection_id_and_product_id", unique: true, using: :btree
  add_index "collection_items", ["collection_id"], name: "index_collection_items_on_collection_id", using: :btree
  add_index "collection_items", ["product_id"], name: "index_collection_items_on_product_id", using: :btree

  create_table "collections", force: true do |t|
    t.string   "name",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "collections", ["name"], name: "index_collections_on_name", using: :btree
  add_index "collections", ["user_id"], name: "index_collections_on_user_id", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "product_id", null: false
    t.text     "text",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "follows", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["followed_id"], name: "index_follows_on_followed_id", using: :btree
  add_index "follows", ["follower_id", "followed_id"], name: "index_follows_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "follows", ["follower_id"], name: "index_follows_on_follower_id", using: :btree

  create_table "likes", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "product_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["product_id"], name: "index_likes_on_product_id", using: :btree
  add_index "likes", ["user_id", "product_id"], name: "index_likes_on_user_id_and_product_id", unique: true, using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name",               null: false
    t.string   "url",                null: false
    t.float    "price",              null: false
    t.text     "note"
    t.integer  "brand_id"
    t.integer  "category_id"
    t.integer  "finder_user_id",     null: false
    t.integer  "editor_user_id",     null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id", using: :btree
  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["editor_user_id"], name: "index_products_on_editor_user_id", using: :btree
  add_index "products", ["finder_user_id"], name: "index_products_on_finder_user_id", using: :btree
  add_index "products", ["name"], name: "index_products_on_name", unique: true, using: :btree
  add_index "products", ["price"], name: "index_products_on_price", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",                                null: false
    t.string   "username",                            null: false
    t.string   "email",                               null: false
    t.boolean  "isEditor",            default: false
    t.string   "password_digest",                     null: false
    t.string   "session_token"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
