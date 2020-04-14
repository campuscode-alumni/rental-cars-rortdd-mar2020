class CarCategory < ApplicationRecord
  validates :name, :daily_rate, :car_insurance, :third_part_insurance, presence: true
  validates :name, uniqueness: true
  validates :daily_rate, :car_insurance, :third_part_insurance, numericality: { greater_than: 0 }
end
