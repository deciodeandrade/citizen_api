FactoryBot.define do
  factory :address do
    zip_code { Faker::Address.postcode }
    street { Faker::Address.street_name }
    complement { Faker::Lorem.paragraph }
    neighborhood { Faker::Address.street_name }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    sequence(:ibge_code) { |n| n }
  end
end
