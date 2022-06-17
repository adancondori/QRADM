# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_06_13_043914) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "rules"
    t.string "code"
    t.datetime "date_init"
    t.datetime "date_end"
    t.decimal "amount", precision: 10, scale: 2
    t.boolean "is_close", default: false
    t.boolean "state", default: true
    t.boolean "is_visible", default: true
    t.bigint "event_id", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_activities_on_event_id"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "custom_auto_increments", force: :cascade do |t|
    t.string "counter_model_name"
    t.integer "counter", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["counter_model_name"], name: "index_custom_auto_increments_on_counter_model_name"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "code"
    t.decimal "amount", precision: 10, scale: 2
    t.integer "type_validation"
    t.datetime "init_date"
    t.datetime "end_date"
    t.boolean "state", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "extra_points", force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2
    t.string "name"
    t.string "description"
    t.string "code"
    t.bigint "event_id", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_extra_points_on_event_id"
    t.index ["user_id"], name: "index_extra_points_on_user_id"
  end

  create_table "group_activities", force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "date_done"
    t.bigint "group_id", null: false
    t.bigint "activity_id", null: false
    t.string "observation"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_group_activities_on_activity_id"
    t.index ["group_id"], name: "index_group_activities_on_group_id"
    t.index ["user_id"], name: "index_group_activities_on_user_id"
  end

  create_table "group_extra_points", force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "date_done"
    t.bigint "group_id", null: false
    t.bigint "extra_point_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["extra_point_id"], name: "index_group_extra_points_on_extra_point_id"
    t.index ["group_id"], name: "index_group_extra_points_on_group_id"
    t.index ["user_id"], name: "index_group_extra_points_on_user_id"
  end

  create_table "group_sanctions", force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "date_done"
    t.bigint "group_id", null: false
    t.bigint "sanction_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_group_sanctions_on_group_id"
    t.index ["sanction_id"], name: "index_group_sanctions_on_sanction_id"
    t.index ["user_id"], name: "index_group_sanctions_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "code"
    t.boolean "state", default: true
    t.bigint "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_groups_on_event_id"
  end

  create_table "parameters", force: :cascade do |t|
    t.string "name"
    t.decimal "amount", precision: 10, scale: 2
    t.string "description"
    t.string "type"
    t.boolean "state", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "phone"
    t.string "code"
    t.string "email"
    t.boolean "state", default: true
    t.bigint "group_id"
    t.bigint "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_people_on_event_id"
    t.index ["group_id"], name: "index_people_on_group_id"
  end

  create_table "sanctions", force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2
    t.string "name"
    t.string "description"
    t.string "code"
    t.bigint "event_id", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_sanctions_on_event_id"
    t.index ["user_id"], name: "index_sanctions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "type_role"
    t.string "phone"
    t.boolean "state", default: true
    t.string "code"
    t.bigint "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "app_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["event_id"], name: "index_users_on_event_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "events"
  add_foreign_key "activities", "users"
  add_foreign_key "extra_points", "events"
  add_foreign_key "extra_points", "users"
  add_foreign_key "group_activities", "activities"
  add_foreign_key "group_activities", "groups"
  add_foreign_key "group_activities", "users"
  add_foreign_key "group_extra_points", "extra_points"
  add_foreign_key "group_extra_points", "groups"
  add_foreign_key "group_extra_points", "users"
  add_foreign_key "group_sanctions", "groups"
  add_foreign_key "group_sanctions", "sanctions"
  add_foreign_key "group_sanctions", "users"
  add_foreign_key "groups", "events"
  add_foreign_key "people", "events"
  add_foreign_key "people", "groups"
  add_foreign_key "sanctions", "events"
  add_foreign_key "sanctions", "users"
  add_foreign_key "users", "events"
end
