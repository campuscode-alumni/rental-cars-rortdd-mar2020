require 'rails_helper'

feature 'Admin add addon to rental' do
  scenario 'view addons' do
     # Arrange
     user = User.create!(email: 'test@test.com', password: '12345678')
     car_category = CarCategory.create!(name: 'A', daily_rate: 100, 
                                        car_insurance: 100, third_part_insurance: 100)
 
     fiat = Manufacturer.create!(name: 'Fiat')
     mobi = CarModel.create!(name: 'Mobi', manufacturer: fiat, car_category: car_category)
     car = Car.create(car_model: mobi, license_plate: 'ABC-1234', mileage: 1000, color: 'Azul',
                      status: :available)
 
     customer = Customer.create!(name: 'Fulano Sicrano', cpf: '57810023594',
                                 email: 'teste@teste.com.br')

     addon = AddOn.create!(name: 'Carrinho de Bebê', daily_rate: 59, serial_number: 'BEBE1234')
     other_addon = AddOn.create!(name: 'Transporte para Bike', daily_rate: 29, serial_number: 'BIKE999')
 
     rental = Rental.create!(start_date: '16/04/2030', end_date: '18/04/2030',
                             customer: customer, car_category: car_category)
 
     # Act
     login_as(user, scope: :user)
     visit start_rental_path(rental.id)

     # Assert
     expect(page).to have_content 'Carrinho de Bebê'
     expect(page).to have_content 'Transporte para Bike'
  end

  scenario 'and choose addons' do
    # Arrange
    user = User.create!(email: 'test@test.com', password: '12345678')
    car_category = CarCategory.create!(name: 'A', daily_rate: 100, 
                                       car_insurance: 100, third_part_insurance: 100)

    fiat = Manufacturer.create!(name: 'Fiat')
    mobi = CarModel.create!(name: 'Mobi', manufacturer: fiat, car_category: car_category)
    car = Car.create(car_model: mobi, license_plate: 'ABC-1234', mileage: 1000, color: 'Azul',
                     status: :available)

    customer = Customer.create!(name: 'Fulano Sicrano', cpf: '57810023594',
                                email: 'teste@teste.com.br')

    addon = AddOn.create!(name: 'Carrinho de Bebê', daily_rate: 59, serial_number: 'BEBE1234')
    other_addon = AddOn.create!(name: 'Transporte para Bike', daily_rate: 29, serial_number: 'BIKE999')
    unused_addon = AddOn.create!(name: 'Carregador para Celular', daily_rate: 9, serial_number: 'CHARG567')

    rental = Rental.create!(start_date: '16/04/2030', end_date: '18/04/2030',
                            customer: customer, car_category: car_category)

    # Act
    login_as(user, scope: :user)
    visit start_rental_path(rental.id)
    select 'Fiat Mobi - Placa: ABC-1234 - Cor: Azul', from: 'Carro'
    check 'Carrinho de Bebê'
    check 'Transporte para Bike'
    click_on 'Confirmar'


    expect(current_path).to eq rental_path(rental.id)
    expect(page).to have_content 'Status Iniciada'
    expect(page).to have_content 'Carrinho de Bebê'
    expect(page).to have_content 'Transporte para Bike'
    expect(page).not_to have_content 'Carregador para Celular'
  end
end