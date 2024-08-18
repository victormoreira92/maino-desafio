class CreateValoresTotais < ActiveRecord::Migration[7.0]
  def change
    create_table :valores_totais do |t|
      t.decimal :valor_produtos
      t.decimal :valor_imposto

      t.timestamps
    end
  end
end
