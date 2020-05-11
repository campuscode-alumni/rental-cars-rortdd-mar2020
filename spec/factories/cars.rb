FactoryBot.define do
  factory :car do
    car_model
    license_plate { 'ABC-1234' }
    mileage { 1000 }
    color { 'Azul' }
  end
end