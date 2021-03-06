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

ActiveRecord::Schema.define(:version => 20131215221322) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories_recovery_resource_drafts", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "recovery_resource_draft_id"
  end

  add_index "categories_recovery_resource_drafts", ["category_id", "recovery_resource_draft_id"], :name => "index_on_cat_id_and_draft_id"
  add_index "categories_recovery_resource_drafts", ["recovery_resource_draft_id"], :name => "index_cats_resources_on_draft_id"

  create_table "categories_recovery_resources", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "recovery_resource_id"
  end

  add_index "categories_recovery_resources", ["category_id", "recovery_resource_id"], :name => "index_on_cat_id_and_resource_id"
  add_index "categories_recovery_resources", ["recovery_resource_id"], :name => "index_cats_resources_on_resource_id"

  create_table "disaster_events", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "disaster_events_recovery_resource_drafts", :id => false, :force => true do |t|
    t.integer "disaster_event_id"
    t.integer "recovery_resource_draft_id"
  end

  add_index "disaster_events_recovery_resource_drafts", ["disaster_event_id", "recovery_resource_draft_id"], :name => "index_on_event_id_and_draft_id"
  add_index "disaster_events_recovery_resource_drafts", ["recovery_resource_draft_id"], :name => "index_events_resources_on_draft_id"

  create_table "disaster_events_recovery_resources", :id => false, :force => true do |t|
    t.integer "disaster_event_id"
    t.integer "recovery_resource_id"
  end

  add_index "disaster_events_recovery_resources", ["disaster_event_id", "recovery_resource_id"], :name => "index_on_event_id_and_resource_id"
  add_index "disaster_events_recovery_resources", ["recovery_resource_id"], :name => "index_events_resources_on_resource_id"

  create_table "entity_type_available_tos", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "entity_type_available_tos_recovery_resource_drafts", :id => false, :force => true do |t|
    t.integer "entity_type_available_to_id"
    t.integer "recovery_resource_draft_id"
  end

  add_index "entity_type_available_tos_recovery_resource_drafts", ["entity_type_available_to_id", "recovery_resource_draft_id"], :name => "index_on_entity_id_and_draft_id"
  add_index "entity_type_available_tos_recovery_resource_drafts", ["recovery_resource_draft_id"], :name => "index_entities_resources_on_draft_id"

  create_table "entity_type_available_tos_recovery_resources", :id => false, :force => true do |t|
    t.integer "entity_type_available_to_id"
    t.integer "recovery_resource_id"
  end

  add_index "entity_type_available_tos_recovery_resources", ["entity_type_available_to_id", "recovery_resource_id"], :name => "index_on_entity_id_and_resource_id"
  add_index "entity_type_available_tos_recovery_resources", ["recovery_resource_id"], :name => "index_entities_resources_on_resource_id"

  create_table "recovery_resource_drafts", :force => true do |t|
    t.string   "name"
    t.boolean  "national"
    t.string   "state"
    t.string   "locale"
    t.text     "description"
    t.boolean  "published"
    t.integer  "recovery_resource_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "recovery_resource_drafts", ["recovery_resource_id"], :name => "index_recovery_resource_drafts_on_recovery_resource_id"

  create_table "recovery_resources", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "national"
    t.string   "state"
    t.string   "locale"
  end

end
