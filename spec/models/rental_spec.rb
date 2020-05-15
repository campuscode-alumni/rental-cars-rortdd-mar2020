require 'rails_helper'

RSpec.describe Rental, type: :model do
  context '#code' do
    context 'when exists' do
      let(:rental) { create(:rental) }

      it 'created automatically' do
        expect(rental.code).not_to be_blank
      end
    end

    context 'must be unique' do
      let(:rental) { create(:rental) }
      let(:another_rental) { build(:rental) }
      
      it 'generates another code' do
        allow(SecureRandom).to receive(:alphanumeric).and_return(rental.code, 
                                                                 'ABC1234')
        another_rental.save
        expect(another_rental.code).not_to be_blank
        expect(another_rental.code).not_to eq(rental.code)
      end
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
