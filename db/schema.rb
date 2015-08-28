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

ActiveRecord::Schema.define(version: 20150828084935) do

  create_table "black_domain_names", force: :cascade do |t|
    t.string   "domain_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "black_domain_names", ["domain_name"], name: "index_black_domain_names_on_domain_name", unique: true

  create_table "domain_update_logs", force: :cascade do |t|
    t.integer  "operation"
    t.string   "domain_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tmp_domain_names", force: :cascade do |t|
    t.string   "domain_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tmp_domain_names", ["domain_name"], name: "index_tmp_domain_names_on_domain_name", unique: true

  create_table "wechat_scenes", force: :cascade do |t|
    t.string   "openid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wechat_users", force: :cascade do |t|
    t.string   "uuid"
    t.string   "openid"
    t.string   "nick_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "wechat_users", ["openid"], name: "index_wechat_users_on_openid"
  add_index "wechat_users", ["uuid"], name: "index_wechat_users_on_uuid"

  create_table "white_domain_names", force: :cascade do |t|
    t.string   "domain_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "white_domain_names", ["domain_name"], name: "index_white_domain_names_on_domain_name", unique: true

end
