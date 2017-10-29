FactoryBot.define do
  factory :specie do
    name { Faker::Name.name }
    scientific_name { Faker::Name.name_with_middle }
  end

  factory :pet do
    name { Faker::Pokemon.name }
    specie
  end
end