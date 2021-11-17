require 'rails_helper'

describe 'Visitor visit homepage' do

  it 'and view welcome message' do
    # Arrange

    # Act
    visit root_path

    # Assert
    expect(page).to have_css('p',text: 'É hora de estudar')
    expect(page).to have_content('Boas-vindas ao Guia de Estudos')
  end

  it 'view all study items' do
    # Arrange
    StudyItem.create(title: 'Capybara', description: 'Estudar sobre essa gem de teste',
                    done: false)
    StudyItem.create(title: 'Heroku', description: 'Aprender a fazer deploy no Heroku',
                    done: true)

    # Act
    visit root_path

    # Assert
    expect(page).to have_content('Capybara')
    expect(page).to have_content('Heroku')
  end

  it 'register a new study item' do
    # 3 As
    # Arrange => Preparar

    # Act => Agir / interagir
    visit root_path
    click_on 'Cadastrar item'
    fill_in 'Título', with: 'Estudar Capybara'
    fill_in 'Descrição', with: 'Aprender sobre Test Driven Rails'
    check 'Feito'
    click_on 'Salvar'

    # Assert => Validar
    expect(current_path).to eq root_path
    expect(page).to have_content 'Estudar Capybara'

  end

end

