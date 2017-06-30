require 'rails_helper'

feature 'User update recipe type' do
  scenario 'successfully' do
    #cria os dados necessários
    dessert = RecipeType.create(name: 'Sobremesa')
    cake = RecipeType.create(name: 'Bolo')

    #simula a ação do usuário
    visit edit_recipe_type_path(cake)

    expect(page).to have_css('h1', text: 'Editar Tipo de Receita')
    fill_in 'Nome', with: 'Bolos'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Bolos')
  end

  scenario 'and all fields must be filled' do
    #cria os dados necessários
    dessert = RecipeType.create(name: 'Sobremesa')
    cake = RecipeType.create(name: 'Bolo')

    #simula a ação do usuário
    visit edit_recipe_type_path(dessert)

    expect(page).to have_css('h1', text: 'Editar Tipo de Receita')

    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Você deve informar o nome do tipo de receita')
  end
end
