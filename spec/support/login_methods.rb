module LoginMethods
  def user_login(user)
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Log in'
  end  
end

# para utilizar, você pode dar include nesse módulo dentro dos seus arquivos de teste