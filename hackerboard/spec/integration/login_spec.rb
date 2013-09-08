# encoding: UTF-8

require 'spec_helper'

describe 'Login' do
  context 'with valid account credentials' do
    let!(:user) { FactoryGirl.create(:user) }

    before do
      visit '/'
      click_link 'Entrar'

      fill_in 'E-mail', with: user.email
      fill_in 'Senha', with: user.password
      click_button 'Entrar'
    end

    it 'redirects to the home page' do
      current_path.should eql(root_path)
    end

    it 'displays success message' do
      page.should have_content('Que bom que você voltou!')
    end

    it 'displays user name' do
      page.should have_content("Olá, #{ user.name }!")
    end
  end

  context 'with invalid account credentials' do
    before do
      visit '/'
      click_link 'Entrar'
      click_button 'Entrar'
    end

    it 'renders form page' do
      current_path.should eql(login_path)
    end

    it 'displays error message' do
      page.should have_content('E-mail/senha inválidos.')
    end
  end
end 