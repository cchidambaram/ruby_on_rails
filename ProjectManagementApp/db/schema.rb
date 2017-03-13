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

ActiveRecord::Schema.define(version: 20130804215234) do

  create_table "issuepriorities", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issues", force: true do |t|
    t.integer  "project_id"
    t.string   "issue_title"
    t.integer  "issue_priority_id"
    t.integer  "issue_status_id"
    t.integer  "issue_creator_id"
    t.integer  "issue_assigned_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "last_updated_at"
    t.datetime "updated_at"
  end

  create_table "issuestatuses", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "project_name"
    t.text     "project_description"
    t.integer  "project_creator_id"
    t.string   "project_manager_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "project_created"
  end

  create_table "roles", force: true do |t|
    t.string   "role_name"
    t.string   "role_description"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "role_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "phone_no"
    t.string   "login_name"
    t.string   "password"
    t.boolean  "approved"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
