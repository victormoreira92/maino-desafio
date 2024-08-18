class CreateDadosDestinatarios < ActiveRecord::Migration[7.0]
  def change
    create_table :dados_destinatarios do |t|
      t.string :cnpj_destinatario
      t.string :nome_destinatario
      t.string :logadouro_destinatario
      t.string :complemento_destinatario
      t.string :bairro_destinatario
      t.string :municipio_destinatario
      t.string :uf_destinatario
      t.string :cep_destinatario
      t.string :pais_destinatario

      t.timestamps
    end
  end
end
