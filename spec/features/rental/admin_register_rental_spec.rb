require 'rails_helper'

feature 'Admin register rental' do
  scenario 'successfully' do
    car_category = CarCategory.create!(name: 'A', daily_rate: 100,
                                       third_part_insurance: 100,
                                       car_insurance: 100)
    client = Client.create!(name: 'Fulano Sicrano', document: '578.100.235-94',
                            email: 'teste@teste.com.br')
    user = User.create!(email: 'test@test.com', password: '12345678')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Log in'
    click_on 'Locações'
    click_on 'Registrar locação'
    fill_in 'Data inicial', with: '16/04/2030'
    fill_in 'Data final', with: '18/04/2030'
    select car_category.name, from: 'Categoria'
    select 'Fulano Sicrano - 578.100.235-94', from: 'Cliente'
    click_on 'Enviar'

    expect(page).to have_content('16/04/2030')
    expect(page).to have_content('18/04/2030')
    expect(page).to have_content(client.identification)
    expect(page).to have_content(/A/)
    expect(page).to have_content('Locação cadastrada com sucesso')
  end

  scenario 'and must fill all fields' do
    user = User.create!(email: 'test@test.com', password: '12345678')

    login_as(user, scope: :user)
    visit root_path
    click_on 'Locações'
    click_on 'Registrar locação'
    click_on 'Enviar'

    expect(page).to have_content('Data inicial não pode ficar em branco')
    expect(page).to have_content('Data final não pode ficar em branco')
    expect(page).to have_content('Cliente é obrigatório(a)')
    expect(page).to have_content('Categoria é obrigatório(a)')
  end
end