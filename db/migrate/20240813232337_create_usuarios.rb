class CreateUsuarios < ActiveRecord::Migration[7.0]
  def change
    create_table :usuarios do |t|
      t.string :nome, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.timestamps
    end
  end
end
