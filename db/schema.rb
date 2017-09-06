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

ActiveRecord::Schema.define(version: 20170901103406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"
  enable_extension "pgcrypto"

  create_table "comments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title", limit: 50, default: ""
    t.text "comment"
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.bigint "user_id"
    t.string "role", default: "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_id"], name: "index_comments_on_commentable_id"
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["commentable_type"], name: "index_comments_on_commentable_type"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "events", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.datetime "starts_at", null: false
    t.datetime "ends_at", null: false
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ends_at"], name: "index_events_on_ends_at"
    t.index ["starts_at"], name: "index_events_on_starts_at"
  end

  create_table "feedback_feedbacks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "sentiment", null: false
    t.uuid "resource_id", null: false
    t.uuid "user_id", null: false
    t.string "ip", null: false
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ip"], name: "index_feedback_feedbacks_on_ip"
    t.index ["resource_id"], name: "index_feedback_feedbacks_on_resource_id"
    t.index ["sentiment"], name: "index_feedback_feedbacks_on_sentiment"
    t.index ["user_id"], name: "index_feedback_feedbacks_on_user_id"
  end

  create_table "feedback_resources", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "uri", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uri"], name: "index_feedback_resources_on_uri", unique: true
  end

  create_table "sessions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "author"
    t.uuid "event_id"
    t.string "video_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email"
    t.string "crypted_password"
    t.string "salt"
    t.string "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token"
  end

end
