# == Schema Information
#
# Table name: usuarios
#
#  id              :bigint           not null, primary key
#  nome            :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :usuario do
    nome { Faker::Name.name }
    email { Faker::Internet.email }
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
