FactoryBot.define do
  factory :dado_destinatario do
    cnpj_destinatario { "MyString" }
    nome_destinatario { "MyString" }
    logadouro_destinatario { "MyString" }
    complemento_destinatario { "MyString" }
    bairro_destinatario { "MyString" }
    municipio_destinatario { "MyString" }
    uf_destinatario { "MyString" }
    cep_destinatario { "MyString" }
    pais_destinatario { "MyString" }
  end
end
