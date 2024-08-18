=begin
id: integer,
cnpj_destinatario: string,
nome_destinatario: string,
logadouro_destinatario: string,
complemento_destinatario: string,
bairro_destinatario: string,
municipio_destinatario: string,
uf_destinatario: string,
cep_destinatario string,
pais_destinatario: string,
fone: string,
nota_fiscal_id: integer

=end
class DadoDestinatario < ApplicationRecord
  belongs_to :nota_fiscal

  validates :bairro_destinatario, :cep_destinatario, :cnpj_destinatario, :logadouro_destinatario,
            :nome_destinatario, :uf_destinatario, :municipio_destinatario, :pais_destinatario, presence: true
end
