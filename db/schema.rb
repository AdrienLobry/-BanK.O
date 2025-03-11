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

ActiveRecord::Schema[7.1].define(version: 2025_03_11_142519) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorite_lists", force: :cascade do |t|
    t.string "title"
    t.string "localisation"
    t.bigint "meals_id", null: false
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meals_id"], name: "index_favorite_lists_on_meals_id"
    t.index ["users_id"], name: "index_favorite_lists_on_users_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mealrestaurants", force: :cascade do |t|
    t.bigint "meals_id", null: false
    t.bigint "restaurants_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meals_id"], name: "index_mealrestaurants_on_meals_id"
    t.index ["restaurants_id"], name: "index_mealrestaurants_on_restaurants_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "photo"
    t.string "localisation"
    t.bigint "recipes_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipes_id"], name: "index_meals_on_recipes_id"
  end

  create_table "proportions", force: :cascade do |t|
    t.bigint "ingredients_id", null: false
    t.string "unit"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "recipes_id"
    t.index ["ingredients_id"], name: "index_proportions_on_ingredients_id"
    t.index ["recipes_id"], name: "index_proportions_on_recipes_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
  end

  create_table "review_restaurants", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.string "title"
    t.text "content"
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "restaurants_id", null: false
    t.index ["restaurants_id"], name: "index_review_restaurants_on_restaurants_id"
    t.index ["users_id"], name: "index_review_restaurants_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favorite_lists", "meals", column: "meals_id"
  add_foreign_key "favorite_lists", "users", column: "users_id"
  add_foreign_key "mealrestaurants", "meals", column: "meals_id"
  add_foreign_key "mealrestaurants", "restaurants", column: "restaurants_id"
  add_foreign_key "meals", "recipes", column: "recipes_id"
  add_foreign_key "proportions", "ingredients", column: "ingredients_id"
  add_foreign_key "proportions", "recipes", column: "recipes_id"
  add_foreign_key "review_restaurants", "restaurants", column: "restaurants_id"
  add_foreign_key "review_restaurants", "users", column: "users_id"
end
