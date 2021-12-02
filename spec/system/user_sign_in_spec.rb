require 'rails_helper'

describe 'User sign in' do
  it 'should sign in' do
    # 3As
    # Arrange
    user = User.create(email: "joao@email.com", password: "12345678")

    # Act
    visit root_path
    click_on "Login"
    fill_in "Email", with: "joao@email.com"
    fill_in "Senha", with: "12345678"
    within("form") do
      click_on "Login"
    end

    # Assert
    expect(current_path).to eq root_path
    expect(page).to have_content("joao@email.com")
    expect(page).to have_link("Sair")
    expect(page).not_to have_link("Login")
  end

  it 'should sign out' do
    # 3As
    # Arrange
    user = User.create(email: "joao@email.com", password: "12345678")

    # Act
    visit root_path
    click_on "Login"
    fill_in "Email", with: "joao@email.com"
    fill_in "Senha", with: "12345678"
    within("form") do
      click_on "Login"
    end
    # Neste ponto ele faz login e volta pra tele inicial
    click_on "Sair"

    # Assert
    expect(current_path).to eq root_path
    expect(page).not_to have_content("joao@email.com")
    expect(page).not_to have_link("Sair")
    expect(page).to have_link("Login")
  end
end