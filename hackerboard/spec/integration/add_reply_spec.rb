# encoding: UTF-8

require 'spec_helper'

describe 'Add reply' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:category) { FactoryGirl.create(:category) }
  let!(:question) do
    FactoryGirl.create(:question, user: user, category: category)
  end

  context 'when logged in' do
    context 'with valid data' do
      before do
        login with: user.email
        visit question_path(question)

        fill_in 'Resposta', with: 'Some reply'
        click_button 'Enviar resposta'
      end

      it 'redirects to the question page' do
        current_path.should eql(question_path(question))
      end

      it 'displays success message' do
        page.should have_content('Sua resposta foi adicionada!')
      end

      it 'displays comment' do
        page.should have_content('Some reply')
      end
    end

    context 'with invalid data' do
      before do
        login with: user.email
        visit question_path(question)

        click_button 'Enviar resposta'
      end

      it 'displays error message' do
        page.should have_content('Você precisa preencher sua resposta.')
      end
    end
  end

  context 'when unlogged' do
    before do
      visit question_path(question)
    end

    it 'displays message' do
      page.should have_content('Você precisa efetuar o login para responder.')
    end

    it 'redirects to the question page' do
      current_path.should eql(question_path(question))
    end
  end
end