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

ActiveRecord::Schema.define(version: 20161001165435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "_hcmeta", force: :cascade do |t|
    t.string  "org_id",  limit: 50
    t.integer "hcver"
    t.text    "details"
  end

  create_table "_sf_event_log", force: :cascade do |t|
    t.string   "table_name",   limit: 128
    t.string   "action",       limit: 7
    t.datetime "synced_at",                default: "now()"
    t.datetime "sf_timestamp"
    t.string   "sfid",         limit: 20
    t.text     "record"
    t.boolean  "processed"
  end

  add_index "_sf_event_log", ["sfid"], name: "idx__sf_event_log_sfid", using: :btree
  add_index "_sf_event_log", ["table_name", "synced_at"], name: "idx__sf_event_log_comp_key", using: :btree

  create_table "_trigger_last_id", id: false, force: :cascade do |t|
    t.integer "trigger_log_id"
  end

  create_table "_trigger_log", force: :cascade do |t|
    t.string   "sfid",         limit: 18
    t.integer  "txid",         limit: 8
    t.text     "old"
    t.string   "action",       limit: 7
    t.string   "state",        limit: 8
    t.text     "values"
    t.integer  "processed_tx", limit: 8
    t.datetime "updated_at",               default: "now()"
    t.integer  "sf_result"
    t.datetime "created_at",               default: "now()"
    t.text     "sf_message"
    t.string   "table_name",   limit: 128
    t.datetime "processed_at"
    t.integer  "record_id"
  end

  add_index "_trigger_log", ["created_at"], name: "_trigger_log_idx_created_at", using: :btree
  add_index "_trigger_log", ["state", "id"], name: "_trigger_log_idx_state_id", using: :btree
  add_index "_trigger_log", ["state", "table_name"], name: "_trigger_log_idx_state_table_name", where: "(((state)::text = 'NEW'::text) OR ((state)::text = 'PENDING'::text))", using: :btree

  create_table "_trigger_log_archive", force: :cascade do |t|
    t.string   "sfid",         limit: 18
    t.integer  "txid",         limit: 8
    t.text     "old"
    t.string   "action",       limit: 7
    t.string   "state",        limit: 8
    t.text     "values"
    t.integer  "processed_tx", limit: 8
    t.datetime "updated_at"
    t.integer  "sf_result"
    t.datetime "created_at"
    t.text     "sf_message"
    t.string   "table_name",   limit: 128
    t.datetime "processed_at"
    t.integer  "record_id"
  end

  add_index "_trigger_log_archive", ["created_at"], name: "_trigger_log_archive_idx_created_at", using: :btree
  add_index "_trigger_log_archive", ["record_id"], name: "_trigger_log_archive_idx_record_id", using: :btree
  add_index "_trigger_log_archive", ["state", "table_name"], name: "_trigger_log_archive_idx_state_table_name", where: "((state)::text = 'FAILED'::text)", using: :btree

  create_table "event", force: :cascade do |t|
    t.text     "description"
    t.string   "_hc_lastop",              limit: 32
    t.datetime "recurrencestartdatetime"
    t.string   "subject",                 limit: 255
    t.boolean  "isdeleted"
    t.datetime "enddatetime"
    t.datetime "systemmodstamp"
    t.datetime "createddate"
    t.datetime "startdatetime"
    t.string   "sfid",                    limit: 18
    t.text     "_hc_err"
    t.date     "recurrenceenddateonly"
    t.boolean  "isalldayevent"
  end

  add_index "event", ["sfid"], name: "hcu_idx_event_sfid", unique: true, using: :btree
  add_index "event", ["systemmodstamp"], name: "hc_idx_event_systemmodstamp", using: :btree

  create_table "salesforce_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "bio"
    t.date     "start_date"
    t.date     "birth_date"
    t.text     "additional_notes"
    t.string   "photo"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.boolean  "yoda"
    t.string   "url"
    t.string   "team_on"
  end

  create_table "term_lists", force: :cascade do |t|
    t.string   "name"
    t.string   "definition"
    t.string   "additional_notes"
    t.string   "term_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user", force: :cascade do |t|
    t.datetime "systemmodstamp"
    t.string   "name",           limit: 121
    t.string   "title",          limit: 80
    t.string   "division",       limit: 80
    t.string   "department",     limit: 80
    t.string   "email",          limit: 128
    t.string   "firstname",      limit: 40
    t.string   "usertype",       limit: 40
    t.string   "_hc_lastop",     limit: 32
    t.string   "city",           limit: 40
    t.text     "_hc_err"
    t.string   "username",       limit: 80
    t.string   "smallphotourl",  limit: 1024
    t.string   "mobilephone",    limit: 40
    t.string   "lastname",       limit: 80
    t.string   "aboutme",        limit: 1000
    t.datetime "createddate"
    t.string   "sfid",           limit: 18
    t.boolean  "isactive"
    t.boolean  "yoda__c"
    t.boolean  "key_user__c"
  end

  add_index "user", ["sfid"], name: "hcu_idx_user_sfid", unique: true, using: :btree
  add_index "user", ["systemmodstamp"], name: "hc_idx_user_systemmodstamp", using: :btree

end
