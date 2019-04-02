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

ActiveRecord::Schema.define(version: 20190402221605) do

  create_table "mentees", force: :cascade do |t|
    t.boolean "is_active"
    t.string "current_role"
    t.string "mentor_role"
    t.string "skill_1"
    t.string "skill_2"
    t.string "skill_3"
    t.integer "years_in_field"
    t.boolean "lead_team"
    t.string "mentor_gender"
    t.string "comm_frequency"
    t.text "bio"
    t.text "in_five_years"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mentors", force: :cascade do |t|
    t.boolean "is_active"
    t.string "current_role"
    t.integer "years_in_field"
    t.integer "years_in_lead"
    t.string "gender"
    t.string "comm_frequency"
    t.text "bio"
    t.text "motivation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "specialized_skills", default: "--- []\n"
    t.string "mentor_roles", default: "--- []\n"
  end

  create_table "mentorships", force: :cascade do |t|
    t.integer "mentor_id"
    t.integer "mentee_id"
    t.integer "match_score"
    t.boolean "is_active"
    t.boolean "mentee_approved"
    t.boolean "mentor_approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mentee_id"], name: "index_mentorships_on_mentee_id"
    t.index ["mentor_id"], name: "index_mentorships_on_mentor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", null: false
    t.string "uid", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "location"
    t.string "image_url"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true
    t.index ["provider"], name: "index_users_on_provider"
    t.index ["uid"], name: "index_users_on_uid"
  end

end
