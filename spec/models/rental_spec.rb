require 'rails_helper'

RSpec.describe Rental, type: :model do
  context '#code' do
    it 'created automatically' do
      car_category = CarCategory.create!(name: 'A', daily_rate: 100, 
                                         car_insurance: 100, 
                                         third_part_insurance: 100)
      customer = Customer.create!(name: 'Fulano Sicrano', cpf: '57810023594',
                              email: 'teste@teste.com.br')
      rental = Rental.new(start_date: '16/04/2030', end_date: '18/04/2030',
                          customer: customer, car_category: car_category)

      rental.save!

      expect(rental.code.size).to eq(6)
    end

    xit 'code must be unique' do
      car_category = CarCategory.create!(name: 'A', daily_rate: 100, 
                                         car_insurance: 100, 
                                         third_part_insurance: 100)
      customer = Customer.create!(name: 'Fulano Sicrano', cpf: '57810023594',
                              email: 'teste@teste.com.br')
      rental = Rental.create!(start_date: '16/04/2030', end_date: '18/04/2030',
                              customer: customer, car_category: car_category)
      other_rental = Rental.new(start_date: '16/04/2030', end_date: '18/04/2030',
                                customer: customer, car_category: car_category)
      allow(SecureRandom).to receive(:alphanumeric).and_return(rental.code)

    end
  end

  context '#status' do
    it 'default to scheduled' do
      car_category = CarCategory.create!(name: 'A', daily_rate: 100, 
                                         car_insurance: 100, 
                                         third_part_insurance: 100)
      customer = Customer.create!(name: 'Fulano Sicrano', cpf: '57810023594',
                              email: 'teste@teste.com.br')
      rental = Rental.new(start_date: '16/04/2030', end_date: '18/04/2030',
                          customer: customer, car_category: car_category)

      rental.save!

      expect(rental.scheduled?).to be true
    end
  end
end
