class Subsidiary < ApplicationRecord
  validates :name, :address, :cnpj, presence: true
end
