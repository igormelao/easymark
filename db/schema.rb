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

ActiveRecord::Schema.define(version: 20171107231052) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "daily_marks", force: :cascade do |t|
    t.integer  "mark_id"
    t.date     "date"
    t.decimal  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mark_id"], name: "index_daily_marks_on_mark_id", using: :btree
  end

  create_table "daily_marks_sellers", force: :cascade do |t|
    t.integer  "daily_mark_id", null: false
    t.integer  "seller_id",     null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["daily_mark_id", "seller_id"], name: "index_daily_marks_sellers_on_daily_mark_id_and_seller_id", unique: true, using: :btree
    t.index ["daily_mark_id"], name: "index_daily_marks_sellers_on_daily_mark_id", using: :btree
    t.index ["seller_id"], name: "index_daily_marks_sellers_on_seller_id", using: :btree
  end

  create_table "marks", force: :cascade do |t|
    t.integer  "store_id"
    t.date     "start_date"
    t.date     "end_date"
    t.date     "month"
    t.decimal  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.index ["store_id"], name: "index_marks_on_store_id", using: :btree
  end

  create_table "sellers", force: :cascade do |t|
    t.string   "name"
    t.integer  "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_sellers_on_store_id", using: :btree
  end

  create_table "stores", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_stores_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name",                                null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "daily_marks", "marks"
  add_foreign_key "daily_marks_sellers", "daily_marks"
  add_foreign_key "daily_marks_sellers", "sellers"
  add_foreign_key "marks", "stores"
  add_foreign_key "sellers", "stores"
  add_foreign_key "stores", "users"
end
