FactoryBot.define do
  factory :usuario do
    nome { Faker::Name.name }
    email { Faker::Internet.email }
    perfil { 0 }
    password { "123456" }
    password_confirmation { "123456" }
  end

  trait :nome_acima_permitido do
    nome { Faker::Lorem.characters(number: 80) }
  end

  trait :email_com_formato_invalido do
    email { Faker::Internet.url }
  end

end
