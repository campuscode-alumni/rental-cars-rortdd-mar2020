class CarRental < ApplicationRecord
  belongs_to :rental
  belongs_to :car
  belongs_to :user
  has_many :add_on_car_rentals
  has_many :add_ons, through: :add_on_car_rentals
end
