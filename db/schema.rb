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

ActiveRecord::Schema.define(version: 20150203055820) do

  create_table "areas", force: :cascade do |t|
    t.string   "areaname",   limit: 255
    t.decimal  "position",               precision: 10
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "categoryname", limit: 255
    t.decimal  "position",                 precision: 10
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "listings", force: :cascade do |t|
    t.string   "listingname", limit: 255
    t.integer  "area_id",     limit: 4
    t.integer  "category_id", limit: 4
    t.decimal  "price",                     precision: 10
    t.text     "contactinfo", limit: 65535
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "fname",            limit: 50,                   null: false
    t.string   "lname",            limit: 50
    t.string   "password",         limit: 255
    t.decimal  "phoneno",                        precision: 10
    t.date     "dob"
    t.string   "gender",           limit: 255
    t.text     "likes",            limit: 65535
    t.text     "address",          limit: 65535
    t.integer  "user_id",          limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "pic_file_name",    limit: 255
    t.string   "pic_content_type", limit: 255
    t.integer  "pic_file_size",    limit: 4
    t.datetime "pic_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",   limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
