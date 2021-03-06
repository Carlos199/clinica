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

ActiveRecord::Schema.define(version: 20180614020626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_brands_on_name", using: :btree
  end

  create_table "cargos", force: :cascade do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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
    t.string   "codigoPostal"
    t.index ["departamento_id"], name: "index_ciudades_on_departamento_id", using: :btree
  end

  create_table "consultas", force: :cascade do |t|
    t.datetime "data"
    t.float    "preco"
    t.string   "nome_plano"
    t.string   "tipo_plano"
    t.string   "tipo_consula"
    t.integer  "medico_id"
    t.integer  "paciente_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["medico_id"], name: "index_consultas_on_medico_id", using: :btree
    t.index ["paciente_id"], name: "index_consultas_on_paciente_id", using: :btree
  end

  create_table "departamentos", force: :cascade do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.integer  "regione_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["regione_id"], name: "index_departamentos_on_regione_id", using: :btree
  end

  create_table "detalle_dias", force: :cascade do |t|
    t.time     "horaini"
    t.time     "horafin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "detallepedidos", force: :cascade do |t|
    t.integer  "solicitado"
    t.integer  "surtido"
    t.integer  "pedido_id"
    t.integer  "item_id"
    t.string   "observaciones"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["item_id"], name: "index_detallepedidos_on_item_id", using: :btree
    t.index ["pedido_id"], name: "index_detallepedidos_on_pedido_id", using: :btree
  end

  create_table "dias", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "empresas", force: :cascade do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.string   "ruc"
    t.string   "siglas"
    t.integer  "ciudade_id"
    t.string   "direccion"
    t.string   "telefono1"
    t.string   "telefono2"
    t.string   "correo"
    t.string   "pagina"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ciudade_id"], name: "index_empresas_on_ciudade_id", using: :btree
  end

  create_table "enfermeros", force: :cascade do |t|
    t.string   "ci"
    t.string   "nro_registro"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "direccion"
    t.integer  "ciudade_id"
    t.integer  "cargo_id"
    t.string   "telefono"
    t.string   "celular"
    t.string   "contacto_familiar"
    t.string   "correo"
    t.string   "foto"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["cargo_id"], name: "index_enfermeros_on_cargo_id", using: :btree
    t.index ["ciudade_id"], name: "index_enfermeros_on_ciudade_id", using: :btree
  end

  create_table "especialidades", force: :cascade do |t|
    t.string   "codigo"
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "estados", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forma_pagos", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "has_horarios", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "horarios", force: :cascade do |t|
    t.time     "horaIni"
    t.time     "horaFin"
    t.integer  "medico_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "dia_id"
    t.index ["medico_id"], name: "index_horarios_on_medico_id", using: :btree
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

  create_table "pacientes", force: :cascade do |t|
    t.string   "ci"
    t.string   "nombre"
    t.string   "apellido"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "celular"
    t.date     "fecha"
    t.string   "correo"
    t.string   "contacto_familiar"
    t.integer  "ciudade_id"
    t.integer  "sexo_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "sangre"
    t.index ["ciudade_id"], name: "index_pacientes_on_ciudade_id", using: :btree
    t.index ["sexo_id"], name: "index_pacientes_on_sexo_id", using: :btree
  end

  create_table "pedidos", force: :cascade do |t|
    t.integer  "codigo"
    t.integer  "proveedore_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["proveedore_id"], name: "index_pedidos_on_proveedore_id", using: :btree
    t.index ["user_id"], name: "index_pedidos_on_user_id", using: :btree
  end

  create_table "proveedores", force: :cascade do |t|
    t.string   "ci"
    t.string   "nombre"
    t.string   "apellido"
    t.integer  "ciudade_id"
    t.string   "direccion"
    t.integer  "empresa_id"
    t.string   "telefono"
    t.string   "cellular"
    t.string   "correo"
    t.string   "foto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ciudade_id"], name: "index_proveedores_on_ciudade_id", using: :btree
    t.index ["empresa_id"], name: "index_proveedores_on_empresa_id", using: :btree
  end

  create_table "regiones", force: :cascade do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservas", force: :cascade do |t|
    t.date     "fecha"
    t.time     "hora"
    t.string   "observaciones"
    t.integer  "paciente_id"
    t.integer  "medico_id"
    t.integer  "estado_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["estado_id"], name: "index_reservas_on_estado_id", using: :btree
    t.index ["medico_id"], name: "index_reservas_on_medico_id", using: :btree
    t.index ["paciente_id"], name: "index_reservas_on_paciente_id", using: :btree
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
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "state"
    t.integer  "user_id"
    t.integer  "paciente_id"
    t.integer  "forma_pago_id"
    t.index ["forma_pago_id"], name: "index_sales_on_forma_pago_id", using: :btree
    t.index ["paciente_id"], name: "index_sales_on_paciente_id", using: :btree
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
  add_foreign_key "consultas", "medicos"
  add_foreign_key "consultas", "pacientes"
  add_foreign_key "departamentos", "regiones"
  add_foreign_key "detallepedidos", "items"
  add_foreign_key "detallepedidos", "pedidos"
  add_foreign_key "empresas", "ciudades"
  add_foreign_key "enfermeros", "cargos"
  add_foreign_key "enfermeros", "ciudades"
  add_foreign_key "horarios", "medicos"
  add_foreign_key "items", "brands"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "units"
  add_foreign_key "medicos", "ciudades"
  add_foreign_key "medicos", "especialidades"
  add_foreign_key "medicos", "sexos"
  add_foreign_key "pacientes", "ciudades"
  add_foreign_key "pacientes", "sexos"
  add_foreign_key "pedidos", "proveedores"
  add_foreign_key "pedidos", "users"
  add_foreign_key "proveedores", "ciudades"
  add_foreign_key "proveedores", "empresas"
  add_foreign_key "reservas", "estados"
  add_foreign_key "reservas", "medicos"
  add_foreign_key "reservas", "pacientes"
  add_foreign_key "sales", "forma_pagos"
  add_foreign_key "sales", "pacientes"
end
