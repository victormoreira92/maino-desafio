=begin
id: integer,
cnpj_eminente: string,
nome_eminente: string,
logadouro_eminente: string,
complemento_eminente: string,
bairro_eminente: string,
municipio_eminente: string,
uf_eminente: string,
cep_eminente: string,
pais_eminente: string,
fone: string,
nota_fiscal_id: integer

=end
class DadoEminente < ApplicationRecord
  belongs_to :nota_fiscal
  validates :fone, :bairro_eminente, :cep_eminente, :cnpj_eminente,:municipio_eminente,
            :logadouro_eminente, :nome_eminente, :pais_eminente, :uf_eminente, :pais_eminente, presence: true
end
