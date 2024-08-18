class CreateRelatorios < ActiveRecord::Migration[7.0]
  def change
    create_table :relatorios do |t|
      t.string :dados
      t.references :documento, null: false, foreign_key: true

      t.timestamps
    end
  end
end
