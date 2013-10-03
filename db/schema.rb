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

ActiveRecord::Schema.define(:version => 20130923123640) do

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

  create_table "so_categories", :force => true do |t|
    t.string  "so_name",        :null => false
    t.integer "so_category_id"
  end

  add_index "so_categories", ["so_category_id"], :name => "so_categories_so_category_id_fk"

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

  add_foreign_key "so_categories", "so_categories", name: "so_categories_so_category_id_fk", dependent: :delete

end
