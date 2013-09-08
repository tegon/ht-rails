require 'spec_helper'

describe 'Add reply' do
  context 'when logged in' do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:category) { FactoryGirl.create(:category) }
    let!(:question) do
      FactoryGirl.create(:question, user: user, category: category)
    end

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

    end
  end

  context 'when unlogged' do

  end
end