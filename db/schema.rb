ActiveRecord::Schema.define(version: 2020_02_17_221731) do

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
