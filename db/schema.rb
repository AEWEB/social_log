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

ActiveRecord::Schema.define(:version => 20131024143616) do

  create_table "categories", :force => true do |t|
    t.string  "name",        :null => false
    t.integer "category_id"
    t.integer "user_id",     :null => false
  end

  add_index "categories", ["category_id"], :name => "categories_category_id_fk"
  add_index "categories", ["user_id"], :name => "categories_user_id_fk"

  create_table "problems", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "year",       :null => false
    t.integer  "month",      :null => false
    t.text     "prob",       :null => false
    t.text     "comment",    :null => false
    t.integer  "answer",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sodatabases", :force => true do |t|
    t.integer "category_id"
    t.integer "user_id",     :null => false
    t.integer "state_id",    :null => false
  end

  add_index "sodatabases", ["category_id"], :name => "sodatabases_category_id_fk"
  add_index "sodatabases", ["state_id"], :name => "sodatabases_state_id_fk"
  add_index "sodatabases", ["user_id"], :name => "sodatabases_user_id_fk"

  create_table "states", :force => true do |t|
    t.string   "status",      :null => false
    t.integer  "career",      :null => false
    t.string   "user_id",     :null => false
    t.string   "user_name",   :null => false
    t.string   "screen_name", :null => false
    t.text     "text",        :null => false
    t.string   "image",       :null => false
    t.datetime "date",        :null => false
  end

  create_table "titles", :force => true do |t|
    t.string   "name"
    t.date     "sales_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "price"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "token"
    t.string   "secret"
  end

  add_foreign_key "categories", "categories", name: "categories_category_id_fk", dependent: :delete
  add_foreign_key "categories", "users", name: "categories_user_id_fk", dependent: :delete

  add_foreign_key "sodatabases", "categories", name: "sodatabases_category_id_fk", dependent: :delete
  add_foreign_key "sodatabases", "states", name: "sodatabases_state_id_fk", dependent: :delete
  add_foreign_key "sodatabases", "users", name: "sodatabases_user_id_fk", dependent: :delete

end
