class AddCascadeDeleteToDadosDestinatarios < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :dados_destinatarios, :notas_fiscais
    add_foreign_key :dados_destinatarios, :notas_fiscais, on_delete: :cascade

  end
end
