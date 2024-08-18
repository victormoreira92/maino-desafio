class AddNotaFiscalToImposto < ActiveRecord::Migration[7.0]
  def change
    add_reference :impostos, :nota_fiscal, null: false, foreign_key: true
  end
end
