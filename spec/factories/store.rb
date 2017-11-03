FactoryBot.define do
  factory :store do
    sequence(:name) { |n| "Loja #{n}" }
    association :user
    sellers [ Seller.new(name: "Vendedor") ]
  end
end
