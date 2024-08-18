class AddNotaFiscalToProduto < ActiveRecord::Migration[7.0]
  def change
    add_reference :produtos, :nota_fiscal, null: false, foreign_key: true
  end
end
