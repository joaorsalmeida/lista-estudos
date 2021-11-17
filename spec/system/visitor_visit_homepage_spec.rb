require 'rails_helper'

describe 'Visitor visit homepage' do

  it 'and view welcome message' do
    visit root_path

    expect(page).to have_css('p',text: 'É hora de estudar')
    expect(page).to have_content('Boas-vindas ao Guia de Estudos')
  end

  it 'view all study items' do
    StudyItem.create(title: 'Capybara', description: 'Estudar sobre essa gem de teste',
                    done: false)
    StudyItem.create(title: 'Heroku', description: 'Aprender a fazer deploy no Heroku',
                    done: true)

    visit root_path

    expect(page).to have_content('Capybara')
    expect(page).to have_content('Heroku')
  end

end

