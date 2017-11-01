FactoryBot.define do
  factory :store do
    name     { FFaker::Name.name }
    user
    after(:build) do |store|
      seller = Seller.create(name: FFaker::Name.name, store: store)
      store.sellers << seller
    end
  end
end
