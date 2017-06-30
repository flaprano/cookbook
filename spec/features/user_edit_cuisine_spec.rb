require 'rails_helper'

feature 'User update cuisine' do
  scenario 'successfully' do
    #cria os dados necessários
    arabian_cuisine = Cuisine.create(name: 'Arabe')
    brazilian_cuisine = Cuisine.create(name: 'Brasileira')

    # simula a ação do usuário
    visit edit_cuisine_path(brazilian_cuisine)

    expect(page).to have_css('h1', text: 'Editar Cozinha')

    fill_in 'Nome', with: 'Francesa'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Francesa')
  end

  scenario 'and all fields must be filled' do
    #cria os dados necessários
    arabian_cuisine = Cuisine.create(name: 'Arabe')
    brazilian_cuisine = Cuisine.create(name: 'Brasileira')

    #simula a ação do usuário
    visit edit_cuisine_path(brazilian_cuisine)

    expect(page).to have_css('h1', text: 'Editar Cozinha')

    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Você deve informar o nome da cozinha')
  end

end
