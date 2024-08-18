class CreateImpostos < ActiveRecord::Migration[7.0]
  def change
    create_table :impostos do |t|
      t.decimal :valor_icms
      t.decimal :valor_ipi
      t.decimal :valor_pis
      t.decimal :valor_cofins

      t.timestamps
    end
  end
end
