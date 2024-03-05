FactoryBot.define do
  factory :citizen do
    full_name { Faker::Name.name }
    cpf { "55846726372" }
    cns { "225011671660003" }
    email { Faker::Internet.email }
    birth_date { "2024-02-29" }
    phone { "11 99999-9999" }
    status { %i(active inactive).sample }
    image { Rack::Test::UploadedFile.new(Rails.root.join("spec/support/images/product_image.png"), 'image/png') }
    address
  end
end
