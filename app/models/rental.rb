class Rental < ApplicationRecord
  belongs_to :client
  belongs_to :car_category
  validates :start_date, :end_date, presence: true
end
