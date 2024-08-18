class RemoveNotaFiscalFromRelatorio < ActiveRecord::Migration[7.0]
  def change
    remove_column :relatorios, :nota_fiscal_id
  end
end
