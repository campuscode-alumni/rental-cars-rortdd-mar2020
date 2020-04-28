require 'rails_helper'

feature 'Admin begin rental' do
  xscenario 'from customer search' do
    # Arrange
    user = User.create
    customer = Customer.create
    car_category = CarCategory.create
    manufacturer = Manufacturer.create
    car_model = CarModel.create

    car = Car.create(status: :available)
    rented_car = Car.create(status: :unavailable)

    rental = Rental.create(status: 'cancelled', customer: customer)

    if rental.status == 'cancelled'
    end


    Rental.where(status: :scheduled) # é LENTO

    
    finished_rental = Rental.create(status: :finished, customer: customer)

    # Act
    login_as(user)
    visit root_path
    click_on 'Clientes'
    fill_in 'Busca', with: '1902831290'
    click_on 'Buscar'
    click_on 'João Almeida'
    click_on 'Iniciar Locação'
    select 'Ford Ka - ABC1234', from: 'Escolha o carro:'
    click_on 'Confirmar'

    # Assert
  end
end