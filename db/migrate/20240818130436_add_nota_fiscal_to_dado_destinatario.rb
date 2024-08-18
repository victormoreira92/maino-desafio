class AddNotaFiscalToDadoDestinatario < ActiveRecord::Migration[7.0]
  def change
    add_reference :dados_destinatarios, :nota_fiscal, null: false, foreign_key: true
  end
end
