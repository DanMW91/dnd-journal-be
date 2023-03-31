# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_03_31_123352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "campaigns_users", id: false, force: :cascade do |t|
    t.bigint "campaign_id", null: false
    t.bigint "user_id", null: false
    t.index ["campaign_id", "user_id"], name: "index_campaigns_users_on_campaign_id_and_user_id"
    t.index ["user_id", "campaign_id"], name: "index_campaigns_users_on_user_id_and_campaign_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.bigint "campaign_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "bio"
    t.text "backstory"
    t.index ["campaign_id"], name: "index_characters_on_campaign_id"
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "group_members", force: :cascade do |t|
    t.bigint "notable_group_id", null: false
    t.string "group_memberable_type", null: false
    t.bigint "group_memberable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_memberable_type", "group_memberable_id"], name: "idx_crt_grp_mmbrs_on_grp_mmbrble_typ_n_grp_mmbrble_id"
    t.index ["notable_group_id"], name: "index_group_members_on_notable_group_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "imageable_type", null: false
    t.bigint "imageable_id", null: false
    t.string "url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  create_table "key_words", force: :cascade do |t|
    t.string "key_wordable_type", null: false
    t.bigint "key_wordable_id", null: false
    t.string "key_word", null: false
    t.bigint "campaign_id"
    t.integer "word_count"
    t.index ["campaign_id"], name: "index_key_words_on_campaign_id"
    t.index ["key_wordable_type", "key_wordable_id"], name: "index_key_words_on_key_wordable_type_and_key_wordable_id"
  end

  create_table "locations", force: :cascade do |t|
    t.bigint "campaign_id", null: false
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campaign_id"], name: "index_locations_on_campaign_id"
  end

  create_table "maps", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_maps_on_location_id"
  end

  create_table "markers", force: :cascade do |t|
    t.bigint "map_id", null: false
    t.string "markerable_type", null: false
    t.bigint "markerable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["map_id"], name: "index_markers_on_map_id"
    t.index ["markerable_type", "markerable_id"], name: "index_markers_on_markerable_type_and_markerable_id"
  end

  create_table "notable_groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "location_id"
    t.bigint "campaign_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campaign_id"], name: "index_notable_groups_on_campaign_id"
    t.index ["location_id"], name: "index_notable_groups_on_location_id"
  end

  create_table "npcs", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name"
    t.string "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "campaign_id", null: false
    t.index ["campaign_id"], name: "index_npcs_on_campaign_id"
  end

  create_table "quests", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "campaign_id", null: false
    t.bigint "location_id"
    t.string "reward"
    t.bigint "npc_id"
    t.string "description", null: false
    t.boolean "complete", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campaign_id"], name: "index_quests_on_campaign_id"
    t.index ["location_id"], name: "index_quests_on_location_id"
    t.index ["npc_id"], name: "index_quests_on_npc_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "write_up_mentions", force: :cascade do |t|
    t.bigint "write_up_id", null: false
    t.string "write_up_mentionable_type", null: false
    t.bigint "write_up_mentionable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "key_word_id"
    t.index ["key_word_id"], name: "index_write_up_mentions_on_key_word_id"
    t.index ["write_up_id"], name: "index_write_up_mentions_on_write_up_id"
    t.index ["write_up_mentionable_type", "write_up_mentionable_id"], name: "idx_wrte_up_mntns_on_wrte_up_mntnble_typ_nd_wrte_up_menble_id"
  end

  create_table "write_ups", force: :cascade do |t|
    t.bigint "campaign_id", null: false
    t.text "content"
    t.integer "session_number"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campaign_id"], name: "index_write_ups_on_campaign_id"
  end

  add_foreign_key "characters", "campaigns"
  add_foreign_key "characters", "users"
  add_foreign_key "group_members", "notable_groups"
  add_foreign_key "key_words", "campaigns"
  add_foreign_key "locations", "campaigns"
  add_foreign_key "maps", "locations"
  add_foreign_key "markers", "maps"
  add_foreign_key "notable_groups", "campaigns"
  add_foreign_key "notable_groups", "locations"
  add_foreign_key "npcs", "campaigns"
  add_foreign_key "quests", "campaigns"
  add_foreign_key "quests", "locations"
  add_foreign_key "quests", "npcs"
  add_foreign_key "write_up_mentions", "key_words"
  add_foreign_key "write_up_mentions", "write_ups"
  add_foreign_key "write_ups", "campaigns"
end
