require 'rails_helper'

feature 'Admin register subsidiary' do
  scenario 'must be signed in' do
    #Arrange
    #Act
    visit new_subsidiary_path

    #Assert
    expect(current_path).to eq new_user_session_path
  end

  scenario 'successfully' do
    #Arrange
    user = User.create!(email: 'joao@email.com', password: '12345678')

    #Act
    login_as(user, scope: :user)
    visit root_path
    click_on 'Filiais'
    click_on 'Cadastrar Nova Filial'
    fill_in 'Nome', with: 'Copacabana'
    fill_in 'Endereço', with: 'Av Nossa Senhora de Copacabana, 100'
    fill_in 'CNPJ', with: '77658541000136'
    click_on 'Criar Filial'

    #Assert
    expect(page).to have_content 'Filial Copacabana'
    expect(page).to have_content 'Endereço: Av Nossa Senhora de Copacabana, 100'
    expect(page).to have_content 'CNPJ: 77658541000136'
  end

  scenario 'must fill in all fields' do
     #Arrange
     user = User.create!(email: 'joao@email.com', password: '12345678')

     #Act
     login_as(user, scope: :user)
     visit root_path
     click_on 'Filiais'
     click_on 'Cadastrar Nova Filial'
     fill_in 'Nome', with: ''
     fill_in 'Endereço', with: ''
     fill_in 'CNPJ', with: ''
     click_on 'Criar Filial'

     #Assert
     expect(page).to have_content('Não foi possível cadastrar a filial')
     expect(page).to have_css('div#errors li', count: 3)
  end
end
