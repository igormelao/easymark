FactoryBot.define do
  factory :daily_mark do
    mark
    date { Date.current }
    value 30
  end
end
