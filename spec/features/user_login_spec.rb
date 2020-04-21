require 'rails_helper'

feature 'User log in' do
  scenario 'successfully' do
    User.create!(email: 'test@test.com.br', password: '12345678')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: 'test@test.com.br'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'

    expect(page).to have_content('Login efetuado com sucesso')
    expect(page).to have_link('Fabricante')
    expect(page).to have_link('Categorias de Carros')
    expect(page).to have_link('Modelos de Carros')
    expect(page).to have_link('Locações')
  end
end