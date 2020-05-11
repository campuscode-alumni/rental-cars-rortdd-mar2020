
FactoryBot.define do
  factory :rental do
    start_date { Date.current }
    end_date { 2.days.from_now }
    customer
    car_category
  end
end