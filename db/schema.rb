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

ActiveRecord::Schema.define(:version => 20130901232553) do

  create_table "equipe_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "equipes", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "equipe_type_id"
    t.integer  "user_id"
    t.integer  "organisation_id"
    t.integer  "coach_id"
    t.integer  "assistant_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "eval_tests", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "video"
  end

  add_index "eval_tests", ["user_id", "created_at"], :name => "index_eval_tests_on_user_id_and_created_at"

  create_table "evaluations", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "exercise_sets", :force => true do |t|
    t.integer  "exercise_id"
    t.integer  "programme_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "exercises", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.string   "video"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "short_desc"
    t.string   "short_name"
  end

  add_index "exercises", ["user_id"], :name => "index_exercises_on_user_id"

  create_table "participations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "equipe_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "prescriptions", :force => true do |t|
    t.integer  "eval_test_id"
    t.integer  "exercise_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "programmes", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "resultats", :force => true do |t|
    t.integer  "user_id"
    t.integer  "equipe_id"
    t.integer  "athlete_id"
    t.integer  "evaluation_id"
    t.integer  "eval_test_id"
    t.integer  "value"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "test_sets", :force => true do |t|
    t.integer  "eval_test_id"
    t.integer  "evaluation_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
