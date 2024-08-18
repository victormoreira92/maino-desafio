FactoryBot.define do
  factory :produto do
    nome { "MyString" }
    ncm { "MyString" }
    cfop { "MyString" }
    unidade_comercializada { "MyString" }
    quantidade { 1 }
    valor_unitario { "9.99" }
  end
end
