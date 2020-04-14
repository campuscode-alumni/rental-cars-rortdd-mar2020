require 'rails_helper'

feature 'Admin view all car categories' do
  scenario 'successfully' do
    c1 = CarCategory.create!(name: 'A', daily_rate: '100', car_insurance: '20',
                        third_part_insurance: '20')
    c2 = CarCategory.create!(name: 'B', daily_rate: '200', car_insurance: '30',
    third_part_insurance: '25')

    visit root_path
    click_on 'Categorias de Carros'

    expect(current_path).to eq car_categories_path
    expect(page).to have_link('Categoria A', href: car_category_path(c1.id))
    expect(page).to have_content('R$ 100,00')
    expect(page).to have_link('Categoria B', href: car_category_path(c2.id))
    expect(page).to have_content('R$ 200,00')
  end

  scenario 'with no categories' do
    visit root_path
    click_on 'Categorias de Carros'

    expect(current_path).to eq car_categories_path
    expect(page).to have_content('Nenhuma categoria cadastrada')
  end
end