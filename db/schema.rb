ActiveRecord::Schema.define(version: 20140922085811) do

  create_table "authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "order",      default: 0
    t.integer  "parent_id",  default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_parent",  default: false
  end

  create_table "components", force: true do |t|
    t.string   "component"
    t.string   "sub"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "controller"
    t.string   "action"
  end

  create_table "components_groups", force: true do |t|
    t.string   "component_id"
    t.string   "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cpanel_settings", force: true do |t|
    t.string   "key"
    t.string   "value"
    t.string   "group"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups_users", force: true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "identities", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "nick"
    t.string   "username"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

end
