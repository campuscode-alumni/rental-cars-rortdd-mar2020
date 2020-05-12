FactoryBot.define do
  factory :car do
    car_model
    license_plate { Faker::Vehicle.license_plate }
    mileage { Faker::Vehicle.mileage }
    color { 'Azul' }
  end
end