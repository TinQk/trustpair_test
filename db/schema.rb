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

ActiveRecord::Schema.define(version: 2019_03_23_235713) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "positions", force: :cascade do |t|
    t.string "emplois", null: false
    t.string "niveau", null: false
    t.string "specialite"
    t.string "type_de_contrat", null: false
    t.string "collectivite", null: false
    t.string "annee", null: false
    t.integer "nombre_d_hommes"
    t.integer "nombre_de_femmes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["emplois", "niveau", "specialite", "type_de_contrat", "collectivite", "annee"], name: "index", unique: true
  end

end
