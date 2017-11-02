FactoryBot.define do
  factory :mark do
    store
    name       { FFaker::Name.name }
    month      { Date.current.beginning_of_month }
    start_date { month }
    end_date   { start_date + 29 }
    value      500
  end
end
