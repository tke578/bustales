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

ActiveRecord::Schema.define(version: 20160919221942) do

  create_table "credentials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id"
    t.string   "access_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "credential_id"
    t.string  "caption_id"
    t.text    "caption_text",       limit: 65535
    t.string  "caption_created_at"
    t.text    "post_link",          limit: 65535
    t.text    "post_tags",          limit: 65535
    t.float   "location_latitude",  limit: 24
    t.float   "location_logitude",  limit: 24
    t.string  "location_id"
    t.text    "location_address",   limit: 65535
    t.string  "location_name"
    t.text    "video_url",          limit: 65535
    t.text    "image_url",          limit: 65535
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
  end

end
