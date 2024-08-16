class CreateNotasFiscais < ActiveRecord::Migration[7.0]
  def change
    create_table :notas_fiscais do |t|
      t.string :serie
      t.string :nNF
      t.datetime :dhEmi
      t.string :dest

      t.timestamps
    end
  end
end
