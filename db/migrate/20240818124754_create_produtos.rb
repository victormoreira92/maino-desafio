class CreateProdutos < ActiveRecord::Migration[7.0]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.string :ncm
      t.string :cfop
      t.string :unidade_comercializada
      t.integer :quantidade
      t.decimal :valor_unitario

      t.timestamps
    end
  end
end
