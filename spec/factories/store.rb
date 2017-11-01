FactoryBot.define do
  factory :store do
    name     { FFaker::Name.name }
    user
    sellers [ Seller.new(name: "Seller") ]
  end
end
