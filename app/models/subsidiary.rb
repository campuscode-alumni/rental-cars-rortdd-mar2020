class Subsidiary < ApplicationRecord
  validates :name, :address, :cnpj, presence: true
  validates :name, :cnpj, uniqueness: true

  validate :valid_cnpj

  def valid_cnpj
    return if cnpj.nil? # guard clause

    unless cnpj.length == 14
      errors.add(:cnpj, 'deve ter 14 números')
    end
    
    unless CNPJ.valid?(cnpj)
      errors.add(:cnpj, 'não é válido')
    end
  end

end
