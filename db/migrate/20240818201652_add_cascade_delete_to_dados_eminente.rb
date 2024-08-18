class AddCascadeDeleteToDadosEminente < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :dados_eminentes, :notas_fiscais
    add_foreign_key :dados_eminentes, :notas_fiscais, on_delete: :cascade
  end
end
