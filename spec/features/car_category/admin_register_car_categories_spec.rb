require 'rails_helper'

feature 'Admin register car categories' do
  scenario 'successfully' do
    # Arrange

    # Act
    visit root_path
    click_on 'Categorias de Carros'
    click_on 'Registrar nova categoria de carro'
    fill_in 'Nome', with: 'A'
    fill_in 'Diária', with: '50'
    fill_in 'Seguro', with: '20'
    fill_in 'Seguro para terceiros', with: '20'
    click_on 'Enviar'

    expect(page).to have_content('Categoria A')
    expect(page).to have_content('Diária: R$ 50,00')
    expect(page).to have_content('Seguro: R$ 20,00')
    expect(page).to have_content('Seguro para terceiros: R$ 20,00')
  end 

  scenario 'must fill in all fields' do
    # Arrange

    # Act
    visit root_path
    click_on 'Categorias de Carros'
    click_on 'Registrar nova categoria de carro'
    fill_in 'Nome', with: ''
    fill_in 'Diária', with: ''
    fill_in 'Seguro', with: ''
    fill_in 'Seguro para terceiros', with: ''
    click_on 'Enviar'

    expect(page).to have_content 'Não foi possível cadastrar a nova categoria'
  end
end