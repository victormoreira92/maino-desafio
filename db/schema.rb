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

ActiveRecord::Schema[7.0].define(version: 2024_08_18_202948) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "dados_destinatarios", force: :cascade do |t|
    t.string "cnpj_destinatario"
    t.string "nome_destinatario"
    t.string "logadouro_destinatario"
    t.string "complemento_destinatario"
    t.string "bairro_destinatario"
    t.string "municipio_destinatario"
    t.string "uf_destinatario"
    t.string "cep_destinatario"
    t.string "pais_destinatario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "nota_fiscal_id", null: false
    t.index ["nota_fiscal_id"], name: "index_dados_destinatarios_on_nota_fiscal_id"
  end

  create_table "dados_eminentes", force: :cascade do |t|
    t.string "cnpj_eminente"
    t.string "nome_eminente"
    t.string "logadouro_eminente"
    t.string "complemento_eminente"
    t.string "bairro_eminente"
    t.string "municipio_eminente"
    t.string "uf_eminente"
    t.string "cep_eminente"
    t.string "pais_eminente"
    t.string "fone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "nota_fiscal_id", null: false
    t.index ["nota_fiscal_id"], name: "index_dados_eminentes_on_nota_fiscal_id"
  end

  create_table "documentos", force: :cascade do |t|
    t.string "titulo"
    t.bigint "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_documentos_on_usuario_id"
  end

  create_table "impostos", force: :cascade do |t|
    t.decimal "valor_icms"
    t.decimal "valor_ipi"
    t.decimal "valor_pis"
    t.decimal "valor_cofins"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "nota_fiscal_id", null: false
    t.index ["nota_fiscal_id"], name: "index_impostos_on_nota_fiscal_id"
  end

  create_table "notas_fiscais", force: :cascade do |t|
    t.string "serie"
    t.string "numero_nota_fiscal"
    t.datetime "data_emissao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "documento_id", null: false
    t.index ["documento_id"], name: "index_notas_fiscais_on_documento_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "nome"
    t.string "ncm"
    t.string "cfop"
    t.string "unidade_comercializada"
    t.integer "quantidade"
    t.decimal "valor_unitario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "nota_fiscal_id", null: false
    t.index ["nota_fiscal_id"], name: "index_produtos_on_nota_fiscal_id"
  end

  create_table "relatorios", force: :cascade do |t|
    t.string "dados"
    t.bigint "documento_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["documento_id"], name: "index_relatorios_on_documento_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.integer "perfil"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  create_table "valores_totais", force: :cascade do |t|
    t.decimal "valor_produtos"
    t.decimal "valor_imposto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "nota_fiscal_id", null: false
    t.index ["nota_fiscal_id"], name: "index_valores_totais_on_nota_fiscal_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "dados_destinatarios", "notas_fiscais", on_delete: :cascade
  add_foreign_key "dados_eminentes", "notas_fiscais", on_delete: :cascade
  add_foreign_key "documentos", "usuarios"
  add_foreign_key "impostos", "notas_fiscais", on_delete: :cascade
  add_foreign_key "notas_fiscais", "documentos"
  add_foreign_key "produtos", "notas_fiscais", on_delete: :cascade
  add_foreign_key "relatorios", "documentos"
  add_foreign_key "valores_totais", "notas_fiscais", on_delete: :cascade
end
