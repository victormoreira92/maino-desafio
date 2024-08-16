class AddEmitToNotasFiscais < ActiveRecord::Migration[7.0]
  def change
    add_column :notas_fiscais, :emit, :string
  end
end
