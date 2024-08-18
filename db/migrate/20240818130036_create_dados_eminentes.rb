class CreateDadosEminentes < ActiveRecord::Migration[7.0]
  def change
    create_table :dados_eminentes do |t|
      t.string :cnpj_eminente
      t.string :nome_eminente
      t.string :logadouro_eminente
      t.string :complemento_eminente
      t.string :bairro_eminente
      t.string :municipio_eminente
      t.string :uf_eminente
      t.string :cep_eminente
      t.string :pais_eminente
      t.string :fone

      t.timestamps
    end
  end
end
