class AddNotaFiscalToDadoEminente < ActiveRecord::Migration[7.0]
  def change
    add_reference :dados_eminentes, :nota_fiscal, null: false, foreign_key: true
  end
end
