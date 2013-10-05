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

ActiveRecord::Schema.define(:version => 20131005213118) do

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "attachments", :force => true do |t|
    t.string   "name"
    t.string   "file"
    t.integer  "material_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "authorizations", :force => true do |t|
    t.string   "uid"
    t.string   "provider"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "code_reference", :limit => 3
    t.string   "slug"
    t.boolean  "is_visible"
  end

  add_index "categories", ["slug"], :name => "index_categories_on_slug", :unique => true

  create_table "categories_materials", :id => false, :force => true do |t|
    t.integer "category_id", :null => false
    t.integer "material_id", :null => false
  end

  add_index "categories_materials", ["category_id", "material_id"], :name => "by_category_and_material", :unique => true

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "definition"
    t.string   "email"
    t.string   "phone_first"
    t.string   "phone_second"
    t.integer  "manufacturer_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "address"
    t.boolean  "rescrict"
  end

  create_table "images", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "image"
    t.integer  "material_id"
    t.boolean  "featured"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "manufacturers", :force => true do |t|
    t.string   "name"
    t.string   "site"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "address"
    t.string   "email"
    t.string   "cnpj"
    t.string   "razao_social"
    t.string   "insc_estadual"
    t.string   "insc_municipal"
    t.string   "city"
    t.string   "state"
    t.string   "cep"
    t.string   "country"
    t.string   "mail_address"
    t.string   "certifications"
    t.integer  "user_id"
    t.string   "phone"
    t.string   "image"
    t.text     "description"
    t.boolean  "forum",              :default => false, :null => false
    t.string   "forum_mail"
    t.string   "postal_address"
    t.string   "postal_city"
    t.string   "postal_state"
    t.string   "postal_cep"
    t.string   "postal_country"
    t.string   "postal_phone"
    t.boolean  "has_postal_address", :default => false, :null => false
  end

  add_index "manufacturers", ["user_id"], :name => "index_manufacturers_on_user_id"

  create_table "materials", :force => true do |t|
    t.text     "resume"
    t.integer  "manufacturer_id"
    t.text     "technical_observation"
    t.string   "density"
    t.string   "dimensions"
    t.string   "average_price"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "name"
    t.string   "slug"
    t.string   "ncm"
    t.string   "certifications"
    t.string   "awards"
    t.string   "code"
    t.boolean  "draft",                 :default => true, :null => false
  end

  add_index "materials", ["slug"], :name => "index_materials_on_slug", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",   :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.string   "encrypted_password",     :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "newsletter",             :default => true
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
