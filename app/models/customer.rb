class Customer < ApplicationRecord
  validates :name, :cpf, :email, presence: true
  validates :cpf, :email, uniqueness: true
  validate :valid_cpf

  def formatted_cpf
    CPF.new(self.cpf).formatted
  end

  def identification
    "#{name} - #{formatted_cpf}"
  end

  def valid_cpf
    return if cpf.nil? # guard clause

    unless cpf.length == 11
      errors.add(:cpf, 'deve ter 11 números')
    end

    unless CPF.valid?(cpf)
      errors.add(:cpf, 'não é válido')
    end
  end


end
