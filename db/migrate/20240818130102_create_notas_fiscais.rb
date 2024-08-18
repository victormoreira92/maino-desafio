class CreateNotasFiscais < ActiveRecord::Migration[7.0]
  def change
    create_table :notas_fiscais do |t|
      t.string :serie
      t.string :numero_nota_fiscal
      t.datetime :data_emissao

      t.timestamps
    end
  end
end
