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

ActiveRecord::Schema.define(:version => 20120525083322) do

  create_table "c2dm_apps", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "application_id"
    t.string   "sender_id"
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "c2dm_devices", :force => true do |t|
    t.string   "registration_id"
    t.integer  "app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "c2dm_notifications", :force => true do |t|
    t.string   "collapse_key"
    t.text     "data"
    t.boolean  "delay_while_idle"
    t.integer  "device_id"
    t.integer  "message_id"
    t.string   "error"
    t.boolean  "deliver",          :default => true
    t.datetime "sent_at"
    t.integer  "tries",            :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "checkins", :force => true do |t|
    t.integer  "restaurant_id"
    t.string   "device_reg"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
