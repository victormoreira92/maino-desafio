FactoryBot.define do
  factory :nota_fiscal do
    serie { "MyString" }
    numero_nota_fiscal { "MyString" }
    data_emissao { Time.now }
    association :documento, :com_arquivo_xml
  end
end
