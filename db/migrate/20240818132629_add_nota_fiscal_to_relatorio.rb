class AddNotaFiscalToRelatorio < ActiveRecord::Migration[7.0]
  def change
    add_reference :relatorios, :nota_fiscal, null: false, foreign_key: true
  end
end
