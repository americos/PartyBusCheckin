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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111103212258) do

  create_table "guestgroups", :force => true do |t|
    t.string   "type"
    t.string   "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guests", :force => true do |t|
    t.string   "name"
    t.string   "locator"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "checked_in",     :default => false
    t.integer  "tickets_bought", :default => 1
    t.string   "event_date"
    t.integer  "guest_group"
  end

  create_table "hosts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pets", :force => true do |t|
    t.string   "name"
    t.string   "breed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
