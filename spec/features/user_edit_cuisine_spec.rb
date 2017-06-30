require 'rails_helper'

feature 'User update cuisine' do
  scenario 'successfully' do
    #cria os dados necessários, nesse caso não vamos criar dados no banco
    arabian_cuisine = Cuisine.create(name: 'Arabe')
    brazilian_cuisine = Cuisine.create(name: 'Brasileira')

    # simula a ação do usuário
    visit root_path

  end

end
