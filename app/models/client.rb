class Client < ApplicationRecord
  has_many :rentals

  def identification
    "#{name} - #{document}"
  end
end