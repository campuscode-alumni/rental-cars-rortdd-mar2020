require 'rails_helper'

feature 'Admin view rentals' do
  scenario 'successfully' do
    car_category = CarCategory.create!(name: 'A', daily_rate: 100, 
                                       car_insurance: 100, 
                                       third_part_insurance: 100)
    client = Client.create!(name: 'Fulano Sicrano', document: '578.100.235-94',
                            email: 'teste@teste.com.br')
    Rental.create!(start_date: '16/04/2030', end_date: '18/04/2030',
                   client: client, car_category: car_category)

    visit root_path
    click_on 'Locações'

    expect(page).to have_content('16/04/2030')
    expect(page).to have_content('18/04/2030')
    expect(page).to have_content('Fulano Sicrano')
    expect(page).to have_content(/A/)
  end

  xscenario 'and don\'t have any' do
  end
end