FactoryBot.define do
  factory :seller do
    name { FFaker::Name.name }
    store
  end
end
