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

ActiveRecord::Schema.define(version: 20180603021834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_brands_on_name", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ciudades", force: :cascade do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.integer  "departamento_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["departamento_id"], name: "index_ciudades_on_departamento_id", using: :btree
  end

  create_table "departamentos", force: :cascade do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.integer  "regione_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["regione_id"], name: "index_departamentos_on_regione_id", using: :btree
  end

  create_table "especialidades", force: :cascade do |t|
    t.string   "codigo"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "code"
    t.string   "description"
    t.integer  "brand_id"
    t.integer  "unit_id"
    t.integer  "stock"
    t.integer  "min_stock"
    t.integer  "category_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.decimal  "price",       precision: 8, scale: 2
    t.index ["brand_id"], name: "index_items_on_brand_id", using: :btree
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
    t.index ["unit_id"], name: "index_items_on_unit_id", using: :btree
  end

  create_table "medicos", force: :cascade do |t|
    t.string   "ci"
    t.string   "nro_registo"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "celular"
    t.date     "fecha"
    t.string   "correo"
    t.string   "contacto_familiar"
    t.integer  "especialidade_id"
    t.integer  "ciudade_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "sexo_id"
    t.index ["ciudade_id"], name: "index_medicos_on_ciudade_id", using: :btree
    t.index ["especialidade_id"], name: "index_medicos_on_especialidade_id", using: :btree
    t.index ["sexo_id"], name: "index_medicos_on_sexo_id", using: :btree
  end

  create_table "regiones", force: :cascade do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sale_details", force: :cascade do |t|
    t.integer  "sale_id"
    t.integer  "number"
    t.integer  "item_id"
    t.integer  "qty"
    t.decimal  "price",      precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer  "number"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "state"
    t.integer  "user_id"
  end

  create_table "sexos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "towns", force: :cascade do |t|
    t.string   "name"
    t.integer  "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "ciudades", "departamentos"
  add_foreign_key "departamentos", "regiones"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "units"
  add_foreign_key "medicos", "ciudades"
  add_foreign_key "medicos", "especialidades"
  add_foreign_key "medicos", "sexos"
end
