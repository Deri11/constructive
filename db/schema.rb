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

ActiveRecord::Schema.define(version: 20160521183843) do

  create_table "shots", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "width"
    t.string   "height"
    t.string   "tags"
    t.string   "image_url"
    t.string   "image_path"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "viewcount"
    t.integer  "likes_count"
    t.integer  "comments_count"
    t.integer  "attachments_count"
    t.integer  "rebounds_count"
    t.integer  "buckets_count"
    t.integer  "dribbble_id"
    t.string   "html_url"
    t.string   "attachments_url"
    t.string   "buckets_url"
    t.string   "comments_url"
    t.string   "likes_url"
    t.string   "projects_url"
    t.boolean  "animated"
    t.integer  "user_id"
    t.string   "user_name"
    t.string   "user_username"
    t.string   "user_html_url"
    t.string   "user_avatar_url"
    t.string   "user_bio"
    t.string   "user_location"
  end

end
