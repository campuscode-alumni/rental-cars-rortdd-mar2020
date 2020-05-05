user = User.create!(email: 'test@test.com', password: '12345678')

car_category = CarCategory.create!(name: 'A', daily_rate: 100, 
                                    car_insurance: 100, third_part_insurance: 100)

another_category = CarCategory.create!(name: 'B', daily_rate: 200, 
                                       car_insurance: 200, third_part_insurance: 200)  

fiat = Manufacturer.create!(name: 'Fiat')

mobi = CarModel.create!(name: 'Mobi', manufacturer: fiat, car_category: car_category)
argos = CarModel.create!(name: 'Argos', manufacturer: fiat, car_category: another_category)

car = Car.create(car_model: mobi, license_plate: 'ABC-1234', mileage: 1000, color: 'Azul')
another_car = Car.create(car_model: argos, license_plate: 'XYZ-9876', mileage: 0, color: 'Preto')

customer = Customer.create!(name: 'Fulano Sicrano', cpf: '57810023594',
                            email: 'teste@teste.com.br')

addon = AddOn.create!(name: 'Carrinho de Bebê', daily_rate: 59, serial_number: 'BEBE1234')
other_addon = AddOn.create!(name: 'Transporte para Bike', daily_rate: 29, serial_number: 'BIKE999')
unused_addon = AddOn.create!(name: 'Carregador para Celular', daily_rate: 9, serial_number: 'CHARG567')

rental = Rental.create!(start_date: '16/04/2030', end_date: '18/04/2030',
                        customer: customer, car_category: car_category)