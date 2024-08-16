class AddDocumentoToNotasFiscais < ActiveRecord::Migration[7.0]
  def change
    add_reference :notas_fiscais, :documento, null: false, foreign_key: true
  end
end
