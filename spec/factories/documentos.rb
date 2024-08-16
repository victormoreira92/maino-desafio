FactoryBot.define do
  factory :documento do
    titulo { Faker::Lorem.word }
    association :usuario
  end

  trait :com_arquivo_xml do
    after(:build) do |documento|
      xml = Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'arquivos', 'dummy.xml'),
                                         'text/xml')
      documento.arquivo.attach(xml)
    end
  end

  trait :com_outro_documento do
    after(:build) do |documento|
      text_file = Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'arquivos', 'dummy.txt'),
                                         'text/plain')
      documento.arquivo.attach(text_file)
    end
  end
end
