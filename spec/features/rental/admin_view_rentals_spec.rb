require 'rails_helper'

feature 'Admin view rentals' do
  scenario 'successfully' do
    user = User.create!(email: 'test@test.com', password: '12345678')
    car_category = CarCategory.create!(name: 'A', daily_rate: 100, 
                                       car_insurance: 100, 
                                       third_part_insurance: 100)
    customer = Customer.create!(name: 'Fulano Sicrano', cpf: '57810023594',
                            email: 'teste@teste.com.br')
    Rental.create!(start_date: '16/04/2030', end_date: '18/04/2030',
                   customer: customer, car_category: car_category)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Locações'

    expect(page).to have_content('16/04/2030')
    expect(page).to have_content('18/04/2030')
    expect(page).to have_content('Fulano Sicrano - 578.100.235-94')
    expect(page).to have_content(/A/)
  end

  xscenario 'and don\'t have any' do
  end

  scenario 'and must be logged in' do
    visit rentals_path

    expect(current_path).to eq(new_user_session_path)
  end
end