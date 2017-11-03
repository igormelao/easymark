FactoryBot.define do
  factory :seller do
    sequence(:name) { |n| "Vendedor #{n}" }
    association :store
  end
end
