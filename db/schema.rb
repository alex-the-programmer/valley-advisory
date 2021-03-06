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

ActiveRecord::Schema.define(version: 20170311074930) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street_address1"
    t.string   "street_address2"
    t.string   "city"
    t.string   "county"
    t.string   "state"
    t.string   "country"
    t.string   "zip"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "candidates", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "desired_position"
    t.string   "current_company"
    t.string   "linked_in_url"
    t.string   "twitter_url"
    t.string   "git_hub_url"
    t.string   "portfolio_url"
    t.string   "website_url"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.integer  "address_id"
    t.string   "cloudbase_url"
    t.string   "linkedin_url"
    t.string   "glassdoors_url"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "hiring_managers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.string   "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resumes", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.binary   "resume_data"
    t.string   "file_name"
    t.string   "content_type"
  end

  create_table "roles", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "hiring_manager_id"
    t.string   "name"
    t.text     "description"
    t.integer  "min_rate"
    t.integer  "max_rate"
    t.string   "employment_time"
    t.string   "employment_type"
    t.integer  "contract_duration_in_months"
    t.string   "travel_type"
    t.boolean  "sponsors_visa"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["company_id"], name: "index_roles_on_company_id", using: :btree
    t.index ["hiring_manager_id"], name: "index_roles_on_hiring_manager_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",          null: false
    t.string   "encrypted_password",     default: "",          null: false
    t.string   "first_name",                                   null: false
    t.string   "last_name",                                    null: false
    t.string   "role",                   default: "candidate", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,           null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "candidates", "users"
  add_foreign_key "companies", "addresses"
  add_foreign_key "hiring_managers", "companies"
  add_foreign_key "hiring_managers", "users"
  add_foreign_key "resumes", "candidates", column: "user_id"
  add_foreign_key "roles", "companies"
  add_foreign_key "roles", "hiring_managers"
end
