json.partial! "users/user", user: @user  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password", limit: 32
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "interests"
  end
