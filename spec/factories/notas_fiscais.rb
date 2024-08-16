FactoryBot.define do
  factory :nota_fiscal do
    serie { Faker::Alphanumeric.alphanumeric(number: 3, min_numeric: 3)  }
    nNF { Faker::Alphanumeric.alphanumeric(number: 9, min_numeric: 9) }
    dhEmi { Time.now }
    emit { Faker::Lorem.sentence }
    dest { Faker::Company.name }
    association :documento,:com_arquivo_xml
  end
end
