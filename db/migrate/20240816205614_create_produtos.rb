class CreateProdutos < ActiveRecord::Migration[7.0]
  def change
    create_table :produtos do |t|
      t.string :xProd
      t.string :nCM
      t.string :cFOP
      t.string :uCom
      t.integer :qCom
      t.decimal :vUnCom

      t.timestamps
    end
  end
end
