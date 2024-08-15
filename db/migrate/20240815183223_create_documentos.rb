class CreateDocumentos < ActiveRecord::Migration[7.0]
  def change
    create_table :documentos do |t|
      t.string :titulo
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
