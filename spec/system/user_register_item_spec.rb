require 'rails_helper'

describe 'User register' do

  it 'must be signed in' do

    visit new_study_item_path

    expect(current_path).to eq new_user_session_path
  end

  it 'a new study item' do
    # 3 As
    # Arrange => Preparar
    user = User.create(email: "joao@email.com", password: "12345678")

    # Act => Agir / interagir
    login_as(user, :scope => :user)
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