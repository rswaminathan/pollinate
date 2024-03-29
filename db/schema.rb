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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111019010221) do

  create_table "answers", :force => true do |t|
    t.string   "ip"
    t.string   "cookie"
    t.integer  "result"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "presentations", :force => true do |t|
    t.datetime "time"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "secret_token"
    t.string   "twitter_handle"
    t.string   "linkedIn_handle"
    t.string   "email"
  end

  create_table "questions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "presentation_id"
    t.boolean  "enabled",         :default => false
    t.string   "choices"
  end

end
