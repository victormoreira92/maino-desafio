class AddNotaFiscalToValorTotal < ActiveRecord::Migration[7.0]
  def change
    add_reference :valores_totais, :nota_fiscal, null: false, foreign_key: true
  end
end
