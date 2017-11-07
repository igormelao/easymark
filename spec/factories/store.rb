FactoryBot.define do
  factory :store do
    sequence(:name) { |n| "Loja #{n}" }
    association :user
    sellers_attributes [ FactoryBot.attributes_for(:seller) ]
  end
end
