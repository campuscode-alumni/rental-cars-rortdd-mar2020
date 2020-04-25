require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'validate mandatory fields' do
    it 'should have a name' do
      sub = Customer.new(name: '')

      result = sub.valid?

      expect(result).to eq false
      expect(sub.errors[:name]).to include 'não pode ficar em branco'
    end

    it 'should have an email' do
      sub = Customer.new(email: '')

      result = sub.valid?

      expect(result).to eq false
      expect(sub.errors[:email]).to include 'não pode ficar em branco'
    end

    it 'should have a cpf' do
      sub = Customer.new(cpf: '')

      result = sub.valid?

      expect(result).to eq false
      expect(sub.errors[:cpf]).to include 'não pode ficar em branco'
    end
  end

  describe 'validate unique fields' do
    it 'should have an unique email' do
      Customer.create!(name: 'Joao Silva', cpf: '57879450777' , email: 'joao@email.com')

      customer = Customer.new(email: 'joao@email.com')

      result = customer.valid?

      expect(result).to be false
      expect(customer.errors[:email]).to include('já está em uso')
    end

    it 'should have an unique cpf' do
      Customer.create!(name: 'Joao Silva', cpf: '57879450777' , email: 'joao@email.com')

      customer = Customer.new(cpf: '57879450777')


      result = customer.valid?

      expect(result).to be false
      expect(customer.errors[:cpf]).to include('já está em uso')
    end
  end

  describe 'validate CPF rules' do
    it 'should have a valid CNPJ with 11 numbers' do
      customer = Customer.new(name: 'Joao Silva', cpf: '123',
                              email: 'joao@email.com')

      result = customer.valid?

      expect(result).to be false
      expect(customer.errors[:cpf]).to include('deve ter 11 números')
    end


    it 'should have a valid CPF' do
      customer = Customer.new(name: 'Joao Silva', cpf: '11111111111',
                              email: 'joao@email.com')

      result = customer.valid?

      expect(result).to be false
      expect(customer.errors[:cpf]).to include('não é válido')
    end
  end
end
